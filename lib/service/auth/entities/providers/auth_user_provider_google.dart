// TODO: https://pub.dev/packages/google_sign_in

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// enum Status {
//   uninitialized,
//   authenticated,
//   authenticating,
//   authenticateError,
//   authenticateCanceled,
// }
//
// class AuthProviderGoogle extends ChangeNotifier {
//   final GoogleSignIn googleSignIn;
//   final FirebaseAuth firebaseAuth;
//   final FirebaseFirestore firebaseFirestore;
//   final SharedPreferences prefs;
//
//   Status _status = Status.uninitialized;
//   Status get status => _status;
//
//   AuthProviderGoogle({
//     // required this.googleSignIn,
//     required this.firebaseAuth,
//     required this.firebaseFirestore,
//     required this.prefs,
//   });
//
//   Future<bool> isLoggedIn() async {
//     try {
//       bool isLoggedIn = await googleSignIn.isSignedIn();
//       if (isLoggedIn && prefs.getString(StorePath.id)?.isNotEmpty == true) {
//         return true;
//       } else {
//         return false;
//       }
//     } on PlatformException catch (e) {
//
//     }
//   }
//
//   String? getFirebaseUserIdFromPreference() => prefs.getString(StorePath.id);
//
//   Future<bool> handleGoogleSignIn() async {
//     _status = Status.authenticating;
//     notifyListeners();
//
//     GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     if (googleUser != null) {
//       GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       User? firebaseUser =
//           (await firebaseAuth.signInWithCredential(credential)).user;
//
//       if (firebaseUser != null) {
//         final QuerySnapshot result = await firebaseFirestore
//             .collection(StorePath.pathUserCollection)
//             .where(StorePath.id, isEqualTo: firebaseUser.uid)
//             .get();
//         final List<DocumentSnapshot> document = result.docs;
//         if (document.isEmpty) {
//           firebaseFirestore
//               .collection(StorePath.pathUserCollection)
//               .doc(firebaseUser.uid)
//               .set({
//             StorePath.id: firebaseUser.uid,
//             StorePath.displayName: firebaseUser.displayName,
//             StorePath.photoUrl: firebaseUser.photoURL,
//             "createdAt: ": DateTime.now().millisecondsSinceEpoch.toString(),
//             StorePath.chattingWith: null
//           });
//
//           User? currentUser = firebaseUser;
//           await prefs.setString(StorePath.id, currentUser.uid);
//           await prefs.setString(StorePath.displayName, currentUser.displayName ?? "");
//           await prefs.setString(StorePath.photoUrl, currentUser.photoURL ?? "");
//           await prefs.setString(StorePath.phoneNumber, currentUser.phoneNumber ?? "");
//         } else {
//           DocumentSnapshot documentSnapshot = document[0];
//           ChatUser chatUser = ChatUser.fromDocument(documentSnapshot);
//           await prefs.setString(StorePath.id, chatUser.id);
//           await prefs.setString(StorePath.displayName, chatUser.displayName);
//           await prefs.setString(StorePath.aboutMe, chatUser.aboutMe);
//           await prefs.setString(StorePath.phoneNumber, chatUser.phoneNumber);
//         }
//         _status = Status.authenticated;
//         notifyListeners();
//         return true;
//       } else {
//         _status = Status.authenticateError;
//         notifyListeners();
//         return false;
//       }
//     } else {
//       _status = Status.authenticateCanceled;
//       notifyListeners();
//       return false;
//     }
//   }
//
//   Future<void> googleSignOut() async {
//     await firebaseAuth.signOut();
//     await googleSignIn.disconnect();
//     await googleSignIn.signOut();
//     _status = Status.uninitialized;
//   }
// }
