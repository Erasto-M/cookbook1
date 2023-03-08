import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cookbook1/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
 class Profile extends StatefulWidget {
   const Profile({Key? key}) : super(key: key);

   @override
   State<Profile> createState() => _ProfileState();
 }

 class _ProfileState extends State<Profile> {
   @override
   Widget build(BuildContext context) {
     return Container(
      child: SingleChildScrollView(
       child: Column(
        children: [
          FutureBuilder(
            future: Provider.of(context).a,
              builder: ),
        ],
       ),
      ),
     );
   }
 }
