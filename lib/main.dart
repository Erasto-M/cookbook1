import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookbook1/logincookbook.dart';
import 'package:cookbook1/sign_inpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'Loginpage1.dart';
import 'package:cookbook1/Polltable.dart';
import 'sign_inpage.dart';
void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
 // FirebaseFirestore firestore = FirebaseFirestore.instance;

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //get firestore => firestore;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:LoginPage() ,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
    );
  }
}
