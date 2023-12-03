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
    apiKey: 'AIzaSyAqVCVJhINe_R4TGIH_VDWETDUCiIoy-BY',
    appId: '1:724745692589:web:e760ca32f72323908bad24',
    messagingSenderId: '724745692589',
    projectId: 'flutter-maps-c9649',
    authDomain: 'flutter-maps-c9649.firebaseapp.com',
    storageBucket: 'flutter-maps-c9649.appspot.com',
    measurementId: 'G-RRJCFJ3LE8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQSRLgdGjkPM4zp2Uy6hHkaLnje7d5hAw',
    appId: '1:724745692589:android:36bd0d29af558b9e8bad24',
    messagingSenderId: '724745692589',
    projectId: 'flutter-maps-c9649',
    storageBucket: 'flutter-maps-c9649.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAf_aq3eJ0lesuDmFabauOl4iiR36S1B14',
    appId: '1:724745692589:ios:547c3aa5e379a81d8bad24',
    messagingSenderId: '724745692589',
    projectId: 'flutter-maps-c9649',
    storageBucket: 'flutter-maps-c9649.appspot.com',
    iosBundleId: 'com.example.flutterMaps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAf_aq3eJ0lesuDmFabauOl4iiR36S1B14',
    appId: '1:724745692589:ios:050514c17f05935b8bad24',
    messagingSenderId: '724745692589',
    projectId: 'flutter-maps-c9649',
    storageBucket: 'flutter-maps-c9649.appspot.com',
    iosBundleId: 'com.example.flutterMaps.RunnerTests',
  );
}