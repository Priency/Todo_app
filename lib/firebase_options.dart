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
    apiKey: 'AIzaSyDCCdvgRMebj0O7Pn4On6DvmpP1U9D-Ops',
    appId: '1:762709274615:web:1cab1ac14cd396135bc8f2',
    messagingSenderId: '762709274615',
    projectId: 'todo-c50a0',
    authDomain: 'todo-c50a0.firebaseapp.com',
    storageBucket: 'todo-c50a0.firebasestorage.app',
    measurementId: 'G-F547WKE3T3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyed9jeRjFgB--cv6hHGSS5ObkhfhiWEc',
    appId: '1:762709274615:android:55dda28a3df4568c5bc8f2',
    messagingSenderId: '762709274615',
    projectId: 'todo-c50a0',
    storageBucket: 'todo-c50a0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3_pNcWaLWeJulZd5WhA7JBBWqvnEZAw8',
    appId: '1:762709274615:ios:c9eea4aa9071cc085bc8f2',
    messagingSenderId: '762709274615',
    projectId: 'todo-c50a0',
    storageBucket: 'todo-c50a0.firebasestorage.app',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3_pNcWaLWeJulZd5WhA7JBBWqvnEZAw8',
    appId: '1:762709274615:ios:c9eea4aa9071cc085bc8f2',
    messagingSenderId: '762709274615',
    projectId: 'todo-c50a0',
    storageBucket: 'todo-c50a0.firebasestorage.app',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDCCdvgRMebj0O7Pn4On6DvmpP1U9D-Ops',
    appId: '1:762709274615:web:ff8705092f0fe6c75bc8f2',
    messagingSenderId: '762709274615',
    projectId: 'todo-c50a0',
    authDomain: 'todo-c50a0.firebaseapp.com',
    storageBucket: 'todo-c50a0.firebasestorage.app',
    measurementId: 'G-1P7SS4M3P4',
  );
}
