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
    apiKey: 'AIzaSyAljy_mWQCLjsUwS_ueKvEOEWPSV7Qto84',
    appId: '1:861005520345:web:2c487f4bec530b3a278dc8',
    messagingSenderId: '861005520345',
    projectId: 'stakedicegame-165ba',
    authDomain: 'stakedicegame-165ba.firebaseapp.com',
    storageBucket: 'stakedicegame-165ba.firebasestorage.app',
    measurementId: 'G-Y7918P9RZB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1zRhlpADwKTb8kgvijiNoRw0YujDIJAg',
    appId: '1:861005520345:android:4e4894fb04b746c5278dc8',
    messagingSenderId: '861005520345',
    projectId: 'stakedicegame-165ba',
    storageBucket: 'stakedicegame-165ba.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGLnbeIkwzvGDAAOnNMDXJTakgPVOWBac',
    appId: '1:861005520345:ios:89ca574dca638fde278dc8',
    messagingSenderId: '861005520345',
    projectId: 'stakedicegame-165ba',
    storageBucket: 'stakedicegame-165ba.firebasestorage.app',
    iosBundleId: 'com.example.projects',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGLnbeIkwzvGDAAOnNMDXJTakgPVOWBac',
    appId: '1:861005520345:ios:89ca574dca638fde278dc8',
    messagingSenderId: '861005520345',
    projectId: 'stakedicegame-165ba',
    storageBucket: 'stakedicegame-165ba.firebasestorage.app',
    iosBundleId: 'com.example.projects',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAljy_mWQCLjsUwS_ueKvEOEWPSV7Qto84',
    appId: '1:861005520345:web:3b37ea68e47d36e5278dc8',
    messagingSenderId: '861005520345',
    projectId: 'stakedicegame-165ba',
    authDomain: 'stakedicegame-165ba.firebaseapp.com',
    storageBucket: 'stakedicegame-165ba.firebasestorage.app',
    measurementId: 'G-G0Y2EYZ3BJ',
  );
}
