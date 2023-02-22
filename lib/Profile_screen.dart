import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              profileimage(context),
              profiledetails(context),
              profilestatus(context),
            ],
          ),
        ),
      ),
    );
  }
   Widget profileimage(BuildContext context){
    return Container();
   }
   Widget profiledetails(BuildContext context){
    return Container();
   }
   Widget profilestatus(BuildContext context){
    return Container();
   }
}
