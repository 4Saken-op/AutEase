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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAWYz2HrQi8viosw----czBAL0pkSMP_ts',
    appId: '1:886570974425:web:ae9621d6f5460251c312c8',
    messagingSenderId: '886570974425',
    projectId: 'autease-8779f',
    authDomain: 'autease-8779f.firebaseapp.com',
    storageBucket: 'autease-8779f.appspot.com',
    measurementId: 'G-WF7RPGCP32',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDV3Z2cUhiZARd1VMFJ9uRNc3ImU-Bt1WM',
    appId: '1:886570974425:android:15bd0dd46797b80fc312c8',
    messagingSenderId: '886570974425',
    projectId: 'autease-8779f',
    storageBucket: 'autease-8779f.appspot.com',
  );
}
