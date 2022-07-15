import 'package:authenticationfirebase/screens/login.dart';
import 'package:authenticationfirebase/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'screens/home.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter demo",
      home: Home(),
      routes: {
                "/login": (context) => login(),
                "/register": (context) => Register(),
                "/home": (context) => Home(),
              },
    );
  }
}


