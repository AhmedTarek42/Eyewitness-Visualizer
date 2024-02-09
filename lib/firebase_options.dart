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
    apiKey: 'AIzaSyDjo5A7aNZmqX1dnxHAUBI0gyWGsbF2eVw',
    appId: '1:392510393129:web:f378db8fc6f1363e5a0538',
    messagingSenderId: '392510393129',
    projectId: 'my-first-project-fb-79907',
    authDomain: 'my-first-project-fb-79907.firebaseapp.com',
    storageBucket: 'my-first-project-fb-79907.appspot.com',
    measurementId: 'G-70MK3EWRK3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-qSoQ31eOMuaHWSE0Xba-OVpZ63YaB80',
    appId: '1:392510393129:android:b4704ea6ec9ec0375a0538',
    messagingSenderId: '392510393129',
    projectId: 'my-first-project-fb-79907',
    storageBucket: 'my-first-project-fb-79907.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBjjkp_Rwyf7XJWh5rh6fwsQXp1IMybUk',
    appId: '1:392510393129:ios:0d066fcf26055ceb5a0538',
    messagingSenderId: '392510393129',
    projectId: 'my-first-project-fb-79907',
    storageBucket: 'my-first-project-fb-79907.appspot.com',
    iosBundleId: 'com.example.graduationProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCBjjkp_Rwyf7XJWh5rh6fwsQXp1IMybUk',
    appId: '1:392510393129:ios:7bf42992f3b0bc585a0538',
    messagingSenderId: '392510393129',
    projectId: 'my-first-project-fb-79907',
    storageBucket: 'my-first-project-fb-79907.appspot.com',
    iosBundleId: 'com.example.graduationProject.RunnerTests',
  );
}
