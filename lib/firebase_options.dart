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
    apiKey: 'AIzaSyBdh7zIoNxvlKP6CwjNF8Uxokx-zlwq7i0',
    appId: '1:169742099573:web:de863b7b84eaeb56fdc43c',
    messagingSenderId: '169742099573',
    projectId: 'interview-task-note-app',
    authDomain: 'interview-task-note-app.firebaseapp.com',
    storageBucket: 'interview-task-note-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHI0xhwccNZAIhI7ixmU6QvIRfiX8uHYA',
    appId: '1:169742099573:android:fa8aa59dbf57a084fdc43c',
    messagingSenderId: '169742099573',
    projectId: 'interview-task-note-app',
    storageBucket: 'interview-task-note-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQBxI7RNJyJD6KOiTgUb3Uasch_fVxnjw',
    appId: '1:169742099573:ios:8ff0915e64974979fdc43c',
    messagingSenderId: '169742099573',
    projectId: 'interview-task-note-app',
    storageBucket: 'interview-task-note-app.appspot.com',
    iosBundleId: 'com.altalha.noteApp',
  );
}
