import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB31fFTQ9tjqXfN2VTvwKWHRj6S8QXxl2I",
            authDomain: "assign-tasks-j9bkc4.firebaseapp.com",
            projectId: "assign-tasks-j9bkc4",
            storageBucket: "assign-tasks-j9bkc4.appspot.com",
            messagingSenderId: "332086804367",
            appId: "1:332086804367:web:8a7db4fcd52aad107915fa"));
  } else {
    await Firebase.initializeApp();
  }
}
