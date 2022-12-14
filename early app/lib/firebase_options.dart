// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart


//await Firebase.initializeApp(
  //options: DefaultFirebaseOptions.currentPlatform, );


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
    apiKey: 'AIzaSyChvTcoBPhOv_9Kj4bA2GQPflB4gODq2T0',
    appId: '1:431073526264:web:f497c33193e54ebc20560d',
    messagingSenderId: '431073526264',
    projectId: 'multi-vendor-992f9',
    authDomain: 'multi-vendor-992f9.firebaseapp.com',
    storageBucket: 'multi-vendor-992f9.appspot.com',
    measurementId: 'G-ZVTXYFT5X6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpNTD7cUK1esfAtjS6shy8iemxjB5D30Q',
    appId: '1:431073526264:android:0645e01cc1b80cf520560d',
    messagingSenderId: '431073526264',
    projectId: 'multi-vendor-992f9',
    storageBucket: 'multi-vendor-992f9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlv4suf5JaHyc5NRcQB3ODAgOziQ-bFWs',
    appId: '1:431073526264:ios:b169a434011029f420560d',
    messagingSenderId: '431073526264',
    projectId: 'multi-vendor-992f9',
    storageBucket: 'multi-vendor-992f9.appspot.com',
    iosClientId: '431073526264-fch6okoj9jmdpk2d6jr5jpf8mih1e1s0.apps.googleusercontent.com',
    iosBundleId: 'com.example.multiVendor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlv4suf5JaHyc5NRcQB3ODAgOziQ-bFWs',
    appId: '1:431073526264:ios:b169a434011029f420560d',
    messagingSenderId: '431073526264',
    projectId: 'multi-vendor-992f9',
    storageBucket: 'multi-vendor-992f9.appspot.com',
    iosClientId: '431073526264-fch6okoj9jmdpk2d6jr5jpf8mih1e1s0.apps.googleusercontent.com',
    iosBundleId: 'com.example.multiVendor',
  );
}
