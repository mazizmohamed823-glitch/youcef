import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBDeDiC6L04d1ATmLoYvlG8saH3haCXc68",
            authDomain: "test-uno-87277.firebaseapp.com",
            projectId: "test-uno-87277",
            storageBucket: "test-uno-87277.firebasestorage.app",
            messagingSenderId: "687628426671",
            appId: "1:687628426671:web:51c96d859d2292114aa35a",
            measurementId: "G-8C9EY70HK4"));
  } else {
    await Firebase.initializeApp();
  }
}
