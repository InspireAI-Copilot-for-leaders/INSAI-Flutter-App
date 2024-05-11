import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyApWw1unPqLyD2laDinZDg5omBVg0V2RDo",
            authDomain: "inspire-ai-40690.firebaseapp.com",
            projectId: "inspire-ai-40690",
            storageBucket: "inspire-ai-40690.appspot.com",
            messagingSenderId: "705064728296",
            appId: "1:705064728296:web:4b07abb9f7c73c4da9bb5d",
            measurementId: "G-01SS8GL4BS"));
  } else {
    await Firebase.initializeApp();
  }
}
