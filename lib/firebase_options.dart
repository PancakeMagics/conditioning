// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDOtH8Al0a2-5tF_pn5kZCByAwX12Y62dk',
    appId: '1:328469599724:web:9298cb0c6501e9b5f95cc9',
    messagingSenderId: '328469599724',
    projectId: 'conditioning-b820e',
    authDomain: 'conditioning-b820e.firebaseapp.com',
    storageBucket: 'conditioning-b820e.appspot.com',
    measurementId: 'G-6VH76MZZQH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBofZSf2wk2Wx57AF3J772cEhRsKEZf9xY',
    appId: '1:328469599724:android:c4dc4b2acd211e26f95cc9',
    messagingSenderId: '328469599724',
    projectId: 'conditioning-b820e',
    storageBucket: 'conditioning-b820e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7E5rkUIwsy8NLpUNYdzbA4xHhc2lzNfo',
    appId: '1:328469599724:ios:bd446b7b6bf869bbf95cc9',
    messagingSenderId: '328469599724',
    projectId: 'conditioning-b820e',
    storageBucket: 'conditioning-b820e.appspot.com',
    iosClientId: '328469599724-svdqsbqb7nm7mc7a75spps1hhvt2l6sj.apps.googleusercontent.com',
    iosBundleId: 'com.example.conditioning',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7E5rkUIwsy8NLpUNYdzbA4xHhc2lzNfo',
    appId: '1:328469599724:ios:bd446b7b6bf869bbf95cc9',
    messagingSenderId: '328469599724',
    projectId: 'conditioning-b820e',
    storageBucket: 'conditioning-b820e.appspot.com',
    iosClientId: '328469599724-svdqsbqb7nm7mc7a75spps1hhvt2l6sj.apps.googleusercontent.com',
    iosBundleId: 'com.example.conditioning',
  );
}
