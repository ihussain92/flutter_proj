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
    apiKey: 'AIzaSyCxONyfKUrGfZWE2RProIxG56Pbxl-ao5k',
    appId: '1:417972756597:web:32963de15db098e409183c',
    messagingSenderId: '417972756597',
    projectId: 'carmanage-f3fa2',
    authDomain: 'carmanage-f3fa2.firebaseapp.com',
    storageBucket: 'carmanage-f3fa2.appspot.com',
    measurementId: 'G-11EMHZS2K3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXh9rV-YSNW248CCVuQW9_IEfbV2y8BsU',
    appId: '1:417972756597:android:f88b894ca2f9d46e09183c',
    messagingSenderId: '417972756597',
    projectId: 'carmanage-f3fa2',
    storageBucket: 'carmanage-f3fa2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAy8_Ynseq3rhztSihQ82es4i2x64BdYAw',
    appId: '1:417972756597:ios:a0255ab730b47fb709183c',
    messagingSenderId: '417972756597',
    projectId: 'carmanage-f3fa2',
    storageBucket: 'carmanage-f3fa2.appspot.com',
    iosBundleId: 'com.example.car',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAy8_Ynseq3rhztSihQ82es4i2x64BdYAw',
    appId: '1:417972756597:ios:3e9f03ab7e538ced09183c',
    messagingSenderId: '417972756597',
    projectId: 'carmanage-f3fa2',
    storageBucket: 'carmanage-f3fa2.appspot.com',
    iosBundleId: 'com.example.car.RunnerTests',
  );
}
