import 'dart:io';
import 'package:cookbook1/listview.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
 class Poll extends StatefulWidget {

   const Poll({Key? key}) : super(key: key);

   @override
   State<Poll> createState() => _PollState();
 }

 class _PollState extends State<Poll> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
   final namecontroller = TextEditingController();
   final agecontroller = TextEditingController();
   final emailcontroller = TextEditingController();
   final passwordcontroller = TextEditingController();
   final picker = ImagePicker();
  CollectionReference students = FirebaseFirestore.instance.collection('students');
  File? _image;

  //get downloadurl => downloadurl;
  Future<String?> uploadImage() async {
    if (_image == null) return null;
    var snapshot = await storage
        .ref()
        .child('images/${DateTime.now().toString()}')
        .putFile(_image!);
    return await snapshot.ref.getDownloadURL();
  }
  Future<void> submitForm() async {
    String name = namecontroller.text;
    String age = agecontroller.text;
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    String? downloadUrl = await uploadImage();

    await firestore.collection('students').doc().set({
      'name': name,
      'age': age,
      'email': email,
      'password': password,
      'image': downloadUrl,
    });
  }
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
              const  Center(
                 child: Text("Students"),
               ),
               _image != null
                   ? Image.file(
                 _image!,
                 height: 100,
               )
                   : const SizedBox(height: 100),
               Center(
                 child: IconButton(onPressed: ()async{
                   final pickedfile = await  picker.pickImage(
                       source: ImageSource.camera,
                   maxWidth: 500,
                     maxHeight: 50,
                   );
                   setState(() {
                     if(pickedfile != null){
                       _image = File(pickedfile.path);
                     }
                     else{
                       print("no file selected");
                     }
                   });
                 },
                     icon: const Icon(Icons.camera_alt),),
               ),
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
               const SizedBox(height:10 ,),
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
                 await submitForm();
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListView()));
                 },
                 child: const Text("submit")),


              const  SizedBox(height: 16,),
               ElevatedButton(onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListStudent()));
               },
                   child: const Text("List")),
             ],
           ),
         ),
       ),
     );
   }

     ListViews() {}
 }
