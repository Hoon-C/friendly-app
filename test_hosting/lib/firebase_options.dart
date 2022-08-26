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
    apiKey: 'AIzaSyCACR7ItJ3CMZ0aJp1mbQ1H81Q-WTICUi0',
    appId: '1:125929605490:web:01eb0a739d8f9489bb75eb',
    messagingSenderId: '125929605490',
    projectId: 'hostingtest-4b03f',
    authDomain: 'hostingtest-4b03f.firebaseapp.com',
    storageBucket: 'hostingtest-4b03f.appspot.com',
    measurementId: 'G-61MY5CF4TP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIShvehk3IYZFkATIwlkedeZcYB1y96vc',
    appId: '1:125929605490:android:35bf3d52a2f12a5ebb75eb',
    messagingSenderId: '125929605490',
    projectId: 'hostingtest-4b03f',
    storageBucket: 'hostingtest-4b03f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCy25PiAu8cyiA4Chzn_3N949WnPZTKOqs',
    appId: '1:125929605490:ios:1e26fa6e4a72b0b9bb75eb',
    messagingSenderId: '125929605490',
    projectId: 'hostingtest-4b03f',
    storageBucket: 'hostingtest-4b03f.appspot.com',
    iosClientId: '125929605490-gmp4vk6lt6pmjo3af9ffspk9re991bng.apps.googleusercontent.com',
    iosBundleId: 'com.testhosting.testHosting',
  );
}