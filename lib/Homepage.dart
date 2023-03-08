import 'package:cookbook1/car.dart';
import 'package:cookbook1/fetchcars.dart';
import 'package:cookbook1/fetchmembers.dart';
import 'package:cookbook1/registermember.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
 class Bottomnav extends StatefulWidget {
   const Bottomnav({Key? key}) : super(key: key);

   @override
   State<Bottomnav> createState() => _BottomnavState();
 }

 class _BottomnavState extends State<Bottomnav> {
   FirebaseAuth  firebaseAuth = FirebaseAuth.instance;
   int selectedindex = 0;
   static  List<Widget> widgetoptions = <Widget>[
     const Home(),
    const  Fetchmember(),
     const Fetchcar(),
   ];
   void onitemtap(int index){
     setState(() {
       selectedindex = index;
     });
   }
   Future<User> getuserId()async{
     return await firebaseAuth.currentUser!;
   }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       // appBar: AppBar(
       //   title: const Text("Members pages"),
       //   centerTitle: true,
       // ),
       body: widgetoptions.elementAt(selectedindex),
       bottomNavigationBar: BottomNavigationBar(
         items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
               icon:Icon(Icons.home),
             label: "Home",
             //backgroundColor: Colors.black,
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.person),
             label: "Members",
             //backgroundColor: Colors.blue,
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.car_crash),
             label: "cars",
             //backgroundColor: Colors.blue,
           ),
          ],
         //type: BottomNavigationBarType.shifting,
         currentIndex: selectedindex,
         iconSize: 20,
         fixedColor: Colors.orange,
         onTap: onitemtap,
         elevation: 5,

       ),
     );
   }
 }
