import 'package:cookbook1/listview.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
 class Poll extends StatefulWidget {

   const Poll({Key? key}) : super(key: key);

   @override
   State<Poll> createState() => _PollState();
 }

 class _PollState extends State<Poll> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //  FirebaseFirestore firestore = FirebaseFirestore
   final namecontroller = TextEditingController();
   final agecontroller = TextEditingController();
   final emailcontroller = TextEditingController();
   final passwordcontroller = TextEditingController();
  CollectionReference Poll = FirebaseFirestore.instance.collection('Poll');

  //get firestore => firestore;

   //pick user input from the textfileds
   // void submitform()async {
   //   String name = namecontroller.text;
   //   String age = agecontroller.text;
   //   String email = emailcontroller.text;
   //   String password = passwordcontroller.text;
   //   await firestore.collection('student').add({
   //     'name': name,
   //     'age': age,
   //     'email': email,
   //     'password': password,
   //   });
   // }
   @override
   Widget build(BuildContext context) {
     return Scaffold(

       appBar: AppBar(
         centerTitle: true,
         title:const Text("Enter your data"),
       ),
       body: Padding(
         padding: const EdgeInsets.all(30.0),
         child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               TextField(
                 controller: namecontroller,
                 keyboardType: TextInputType.text,
                 decoration: const InputDecoration(
                   hintText: "name"
                 ),
               ),
              const  SizedBox(height: 10,),
               TextField(
                 controller: agecontroller,
                 keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                     hintText: "age"
                 ),
               ),
               const SizedBox(height: 10,),
               TextField(
                 controller: emailcontroller,
                 keyboardType: TextInputType.emailAddress,
                 decoration: const InputDecoration(
                     hintText: "email"
                 ),
               ),
               SizedBox(height:10 ,),
               TextField(
                 controller: passwordcontroller,
                 keyboardType: TextInputType.text,
                 decoration: const InputDecoration(
                     hintText: "password"
                 ),
                 obscureText: true,
               ),
              const SizedBox(height: 10,),
               ElevatedButton(onPressed: ()async{
                 String name = namecontroller.text;
                 String age = agecontroller.text;
                 String email = emailcontroller.text;
                 String password = passwordcontroller.text;
                 await firestore.collection('teachers').doc().set({
                   'name': name,
                   'age': age,
                   'email': email,
                   'password': password,
                 });
               }, child: const Text("submit")),
               ElevatedButton(onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListViewExample()));
               },
                   child: const Text("List")),
               StreamBuilder<QuerySnapshot>(
                   stream:Poll.snapshots(),

                   builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                     if(snapshot.hasError){
                       return Text('Error: ${snapshot.error}');
                     }
                     if(snapshot.connectionState==ConnectionState.waiting){
                       return CircularProgressIndicator(color: Colors.red,);
                     }
                     return ListView(
                       children: snapshot.data!.docs.map((DocumentSnapshot document) {
                         Map<String,dynamic> data = document.data() as Map<String,dynamic>;
                         return Container(
                           child: Row(
                             children: [
                               Text('Name: ${data['name']}'),
                               Text('Age: ${data['age']}'),
                               Text('Email: ${data['email']}'),
                               Text('Password: ${data['password']}'),
                             ],
                           ),
                         );
                       }).toList(),
                     );
                   } ),

             ],
           ),
         ),
       ),
     );
   }
 }
