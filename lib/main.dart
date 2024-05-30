import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/firebase_options.dart';
// ignore: unused_import
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/paiment.dart';

// ignore: unused_import
import 'package:flutter_application_2/welcome_ui.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: duplicate_import
import 'firebase_options.dart';
void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(MyApp());
}

class MyApp extends StatelessWidget { 
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentPage(), // Navigate to your desired screen
    );
  }
}

