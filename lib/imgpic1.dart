import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
class imgpic extends StatefulWidget {
  const imgpic({Key? key}) : super(key: key);

  @override
  State<imgpic> createState() => _imgpicState();
}

class _imgpicState extends State<imgpic> {
  FirebaseStorage storage = FirebaseStorage.instance;
  File? _photos;
  final ImagePicker _picker = ImagePicker();
  Future fromCamera()async{
    final Pickedfile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if(Pickedfile != null){
        _photos = File(Pickedfile.path);
        uploadFile();
      }
      else{
        print("No file selected");
      }
    });
  }
  Future FromGallery()async{
    final Pickedfile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(Pickedfile != null){
        _photos = File(Pickedfile.path);
        uploadFile();
      }
      else{
        print("No pic found");
      }
    });
  }
  Future uploadFile()async{
    if(_photos != null)  return;
    final filename = basename(_photos!.path);
    final destination = ('files/$filename');
    try{
      final ref =  FirebaseStorage.instance.ref(destination).child('files/');
      await ref.putFile(_photos!);
      ref.getDownloadURL();
    }catch(e){
      print("error occured");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}














class imagepicker{
  final FirebaseStorage storage = FirebaseStorage.instance;
  File? image;
  final ImagePicker _picker = ImagePicker();
  Future fromGallery()async{
    final  pickedFile = await  _picker.pickImage(source: ImageSource.camera);

  }
}
