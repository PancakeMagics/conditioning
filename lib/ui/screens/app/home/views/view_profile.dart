import 'dart:io' show File;
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:conditioning/ui/elements/_generics/decorations/decoration_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../elements/_generics/icons/icon_default_avatar.dart';
import '../../../../elements/_generics/loading/loading_image_builder.dart';
import '../../../../elements/_generics/sized_box.dart';

class AppProfileView extends StatefulWidget {
  const AppProfileView({Key? key}) : super(key: key);

  @override
  _AppProfileViewState createState() => _AppProfileViewState();
}

class _AppProfileViewState extends State<AppProfileView> {
  late final TextEditingController _nameController;
  late final TextEditingController _aboutMeController;
  late final TextEditingController _phoneController;

  File? _avatarFile;
  String _avatarUrl = '';
  String _dialCodeDigits = '+00';

  @override
  void initState() {
    // TODO: init text with real value
    _nameController = TextEditingController();
    _aboutMeController = TextEditingController();
    _phoneController = TextEditingController();


    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _aboutMeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.title_profile)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              // onTap: () => pickAndUploadImage(), // TODO pick image
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: _avatarFile != null
                      ? Image.file(
                          _avatarFile!,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        )
                      : _avatarUrl.isEmpty
                          ? defaultAvatar
                          : Image.network(
                              _avatarUrl,
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                              errorBuilder: (context, object, stackTrace) =>
                                  defaultAvatar,
                              loadingBuilder: avatarImageLoadingBuilder,
                            ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(context.loc.textFieldTitle_name),
                vertical5,
                TextField(
                  decoration: decorationTextField,
                  controller: _nameController,
                ),
                vertical15,

                Text(context.loc.textFieldTitle_aboutMe),
                vertical5,
                TextField(
                  controller: _aboutMeController,
                  decoration: decorationTextField,
                ),
                vertical15,

                // TODO: pick country code
                // const CountryPickerWidget(),
                // vertical15,

                Text(context.loc.textFieldTitle_phone),
                vertical5,
                TextField(
                  decoration: decorationTextField.copyWith(
                    prefix: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(_dialCodeDigits,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  controller: _phoneController,
                  maxLength: 12,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),

            // TODO: update with fireStore
            // ElevatedButton(
            //     onPressed: updateFirestoreData,
            //     child: const Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: Text('Update Info'),
            //     ),
            // ),
          ],
        ),
      ),
    );
  }
}
