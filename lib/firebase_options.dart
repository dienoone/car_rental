// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBh1pOk0gJn5DQk3IhYMI02eODnzosvPKw',
    appId: '1:557492228345:web:48e5f11313a984755a5228',
    messagingSenderId: '557492228345',
    projectId: 'ahmed-61074',
    authDomain: 'ahmed-61074.firebaseapp.com',
    storageBucket: 'ahmed-61074.firebasestorage.app',
    measurementId: 'G-03NHP1GKCG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWtNn9s92D81Kh8Bl_z6BihB58I7WELvk',
    appId: '1:557492228345:android:c3473e07b2f9cb745a5228',
    messagingSenderId: '557492228345',
    projectId: 'ahmed-61074',
    storageBucket: 'ahmed-61074.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlwNc5NBdweQthKofP9ZLN3s11dHhgSzg',
    appId: '1:557492228345:ios:85cae8c7f628fd715a5228',
    messagingSenderId: '557492228345',
    projectId: 'ahmed-61074',
    storageBucket: 'ahmed-61074.firebasestorage.app',
    iosBundleId: 'com.example.carRentalFinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlwNc5NBdweQthKofP9ZLN3s11dHhgSzg',
    appId: '1:557492228345:ios:85cae8c7f628fd715a5228',
    messagingSenderId: '557492228345',
    projectId: 'ahmed-61074',
    storageBucket: 'ahmed-61074.firebasestorage.app',
    iosBundleId: 'com.example.carRentalFinal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBh1pOk0gJn5DQk3IhYMI02eODnzosvPKw',
    appId: '1:557492228345:web:7bdc1f186c14d9615a5228',
    messagingSenderId: '557492228345',
    projectId: 'ahmed-61074',
    authDomain: 'ahmed-61074.firebaseapp.com',
    storageBucket: 'ahmed-61074.firebasestorage.app',
    measurementId: 'G-85PVDCP7T0',
  );

}