import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hub_ideias/app.dart';
import 'package:flutter_hub_ideias/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCiS0ga8SKPdQLCQzxzFRuUJgJEBKILbFs",
        authDomain: "hub-de-ideias.firebaseapp.com",
        projectId: "hub-de-ideias",
        storageBucket: "hub-de-ideias.appspot.com",
        messagingSenderId: "284885568525",
        appId: "1:284885568525:web:0634dff1c66e1e6c815944",
        measurementId: "G-TG8L4N483J",
      ),
    );
  }

  runApp(const MyApp());
}
