import 'dart:io';
import 'package:conditioning/service/store/entities/providers/local/preferences/shared_preference_utils.dart';
import 'package:conditioning/service/store/utils/store_path.dart';
import 'package:conditioning/ui/elements/_generics/decorations/decoration_text_field.dart';
import 'package:conditioning/ui/elements/_generics/theme/my_colors.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/elements/_generics/loading/loading_image_builder.dart';
import '../message/message_chat.dart';
import '../message/provider_chat.dart';
import 'chat_image.dart';
import 'chat_message_bubble.dart';

class ChatPage extends StatefulWidget {
  final String peerId;
  final String peerAvatar;
  final String peerNickname;
  final String userAvatar;

  const ChatPage({
    Key? key,
    required this.peerNickname,
    required this.peerAvatar,
    required this.peerId,
    required this.userAvatar,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late String currentUserId;

  // TODO: only list the current user's messages
  List<QueryDocumentSnapshot> listMessages = [];

  int _limit = 20;
  final int _limitIncrement = 20;
  String groupChatId = '';

  File? imageFile;
  bool isLoading = false;
  bool isShowSticker = false;
  String imageUrl = '';

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChanged);
    scrollController.addListener(_scrollListener);

    if (currentUserId.compareTo(widget.peerId) > 0) {
      groupChatId = '$currentUserId - ${widget.peerId}';
    } else {
      groupChatId = '${widget.peerId} - $currentUserId';
    }

    // chatProvider.updateFirestoreData(StorePath.userCollection,
    //     currentUserId, {StorePath.chattingWith: widget.peerId});
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() => _limit += _limitIncrement);
    }
  }

  void onFocusChanged() {
    if (focusNode.hasFocus) {
      setState(() => isShowSticker = false);
    }
  }

  // Future pickAndSendImage() async {
  //   XFile? pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     imageFile = File(pickedFile.path);
  //     if (imageFile != null) {
  //
  //       setState(() => isLoading = true);
  //       String fileName =
  //           '$currentUserId-image-${DateTime.now().millisecondsSinceEpoch}';
  //
  //       // TODO: integrate with profile avatar uploadImage
  //       UploadTask uploadTask = chatProvider.uploadImageFile(imageFile!, fileName);
  //       try {
  //         TaskSnapshot snapshot = await uploadTask;
  //         imageUrl = await snapshot.ref.getDownloadURL();
  //         setState(() {
  //           isLoading = false;
  //           onSendMessage(imageUrl, MessageType.image);
  //         });
  //       } on FirebaseException catch (e) {
  //
  //         Fluttertoast.showToast(msg: e.message ?? e.toString());
  //       } finally {
  //         setState(() => isLoading = false);
  //       }
  //     }
  //   }
  // }

  void getSticker() {
    focusNode.unfocus();
    setState(() => isShowSticker = !isShowSticker);
  }

  Future<bool> onBackPressed() {
    if (isShowSticker) {
      setState(() => isShowSticker = false);
    } else {
      // chatProvider.updateFirestoreData(StorePath.userCollection,
      //     currentUserId, {StorePath.chattingWith: null});
    }
    return Future.value(false);
  }

  void _callPhoneNumber(String phoneNumber) async {
    var uri = Uri.parse('tel://$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Error Occurred';
    }
  }

  void onSendMessage(String content, int type) {
    if (content.isNotEmpty) {
      textEditingController.clear();
      // chatProvider.sendChatMessage(content, type, groupChatId, currentUserId, widget.peerId);
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  // checking if received message
  bool isMessageReceived(int index) {
    if (index == 0 || (index > 0 && listMessages[index - 1].get(StorePath.idFrom) == currentUserId)) {
      return true;
    } else {
      return false;
    }
  }

  // checking if sent message
  bool isMessageSent(int index) {
    if ((index > 0 &&
            listMessages[index - 1].get(StorePath.idFrom) !=
                currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.peerNickname),
        actions: [
          IconButton(
            onPressed: () async {
              String callPhoneNumber = (await SharedPreferenceUtils().getPref(key: StorePath.phoneNumber)) ?? "";
              _callPhoneNumber(callPhoneNumber);
            },
            icon: const Icon(Icons.phone),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              // buildListMessage(),
              buildMessageInput(),
            ],
          ),
        ),
      ),
    );
  }
  //
  // Widget buildListMessage() {
  //   return Flexible(
  //     child: groupChatId.isNotEmpty
  //     //TODO: move to bloc layer
  //         ? StreamBuilder<QuerySnapshot>(
  //             stream: chatProvider.getChatMessage(groupChatId, _limit),
  //             builder: (context, snapshot) {
  //               return snapshot.hasData
  //                   ? snapshot.data!.docs.isNotEmpty
  //                       ? ListView.builder(
  //                           padding: const EdgeInsets.all(10),
  //                           itemCount: snapshot.data?.docs.length,
  //                           reverse: true,
  //                           controller: scrollController,
  //                           itemBuilder: (context, index) =>
  //                               buildItem(index, snapshot.data?.docs[index]))
  //                       : const Center(child: Text('No messages...'))
  //                   : const Center(
  //                       child: CircularProgressIndicator(
  //                           color: MyColors.burgundy));
  //             })
  //         : const Center(child: defaultAvatar),
  //   );
  // }

  Widget buildItem(int index, DocumentSnapshot? documentSnapshot) {
    if (documentSnapshot != null) {
      ChatMessages chatMessages = ChatMessages.fromDocument(documentSnapshot);
      if (chatMessages.idFrom == currentUserId) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                chatMessages.type == MessageType.text
                    ? messageBubble(
                        chatContent: chatMessages.content,
                        color: MyColors.blue,
                        textColor: MyColors.white,
                        margin: const EdgeInsets.only(right: 10),
                      )
                    : chatMessages.type == MessageType.image
                        ? Container(
                            margin: const EdgeInsets.only(
                                right: 10, top: 10),
                            child: chatImage(
                                imageSrc: chatMessages.content, onTap: () {}),
                          )
                        : const SizedBox.shrink(),
                isMessageSent(index)
                    ? Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          widget.userAvatar,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          loadingBuilder: messageImageLoadingBuilder,
                          errorBuilder: (context, object, stackTrace) {
                            return const Icon(
                              Icons.account_circle,
                              size: 35,
                              color: MyColors.grey,
                            );
                          },
                        ),
                      )
                    : Container(width: 35),
              ],
            ),
            isMessageSent(index)
                ? Container(
                    margin: const EdgeInsets.only(
                        right: 50,
                        top: 6,
                        bottom: 8),
                    child: Text(
                      DateFormat('dd MMM yyyy, hh:mm a').format(
                        DateTime.fromMillisecondsSinceEpoch(
                          int.parse(chatMessages.timestamp),
                        ),
                      ),
                      style: const TextStyle(
                          color: MyColors.lightGrey,
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isMessageReceived(index)
                    // left side (received message)
                    ? Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          widget.peerAvatar,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext ctx, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: MyColors.burgundy,
                                value: loadingProgress.expectedTotalBytes !=
                                            null &&
                                        loadingProgress.expectedTotalBytes !=
                                            null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, object, stackTrace) {
                            return const Icon(
                              Icons.account_circle,
                              size: 35,
                              color: MyColors.grey,
                            );
                          },
                        ),
                      )
                    : Container(
                        width: 35,
                      ),
                chatMessages.type == MessageType.text
                    ? messageBubble(
                        color: MyColors.burgundy,
                        textColor: MyColors.white,
                        chatContent: chatMessages.content,
                        margin: const EdgeInsets.only(left: 10),
                      )
                    : chatMessages.type == MessageType.image
                        ? Container(
                            margin: const EdgeInsets.only(
                                left: 10, top: 10),
                            child: chatImage(
                                imageSrc: chatMessages.content, onTap: () {}),
                          )
                        : const SizedBox.shrink(),
              ],
            ),
            isMessageReceived(index)
                ? Container(
                    margin: const EdgeInsets.only(
                        left: 50,
                        top: 6,
                        bottom: 8),
                    child: Text(
                      DateFormat('dd MMM yyyy, hh:mm a').format(
                        DateTime.fromMillisecondsSinceEpoch(
                          int.parse(chatMessages.timestamp),
                        ),
                      ),
                      style: const TextStyle(
                          color: MyColors.lightGrey,
                          fontSize: 12,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildMessageInput() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color: MyColors.burgundy,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              // TODO
              // onPressed: pickAndSendImage,
              onPressed: () {},
              icon: const Icon(
                Icons.photo,
                size: 28,
              ),
              color: MyColors.white,
            ),
          ),
          Flexible(
              child: TextField(
            focusNode: focusNode,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            controller: textEditingController,
            decoration:
                decorationTextField.copyWith(hintText: 'write here...'),
          )),
          Container(
            margin: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              color: MyColors.burgundy,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              onPressed: () =>
                  onSendMessage(textEditingController.text, MessageType.text),
              icon: const Icon(Icons.send_rounded),
              color: MyColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
