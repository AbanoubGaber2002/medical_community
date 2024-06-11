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
    apiKey: 'AIzaSyBfkILXvCvUTpv4qU9LGzIonu2hUxUgWgw',
    appId: '1:109992796342:web:b11a02cd3295a8f6d5c617',
    messagingSenderId: '109992796342',
    projectId: 'medical-community-c4b5c',
    authDomain: 'medical-community-c4b5c.firebaseapp.com',
    storageBucket: 'medical-community-c4b5c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBi5yEKYaZg5vwPqoVka32uHuTaqSlpJX0',
    appId: '1:109992796342:android:8e657957f892bdc4d5c617',
    messagingSenderId: '109992796342',
    projectId: 'medical-community-c4b5c',
    storageBucket: 'medical-community-c4b5c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQ_Anrk9xyUv8hSSOIbYAFoOAi_pCkO1Q',
    appId: '1:109992796342:ios:bcb772529d880bf2d5c617',
    messagingSenderId: '109992796342',
    projectId: 'medical-community-c4b5c',
    storageBucket: 'medical-community-c4b5c.appspot.com',
    iosBundleId: 'com.example.myFlutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQ_Anrk9xyUv8hSSOIbYAFoOAi_pCkO1Q',
    appId: '1:109992796342:ios:b2627ea62247b4ccd5c617',
    messagingSenderId: '109992796342',
    projectId: 'medical-community-c4b5c',
    storageBucket: 'medical-community-c4b5c.appspot.com',
    iosBundleId: 'com.example.myFlutterApp.RunnerTests',
  );
}
