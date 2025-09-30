import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBfFSUZRAL_9Lew95IyjuknFsRF17U5TEA",
            authDomain: "krishi-sahyog-riteshkray.firebaseapp.com",
            projectId: "krishi-sahyog-riteshkray",
            storageBucket: "krishi-sahyog-riteshkray.firebasestorage.app",
            messagingSenderId: "613315463539",
            appId: "1:613315463539:web:e7a91b8bb4f3eb160a1d06",
            measurementId: "G-89BEJ7PZ2F"));
  } else {
    await Firebase.initializeApp();
  }
}
