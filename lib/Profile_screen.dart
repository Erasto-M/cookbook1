import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  profileimage(context),
                  profiledetails(context),
                  profilestatus(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
   Widget profileimage(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.tealAccent,
      ),
      height: 250,
      width: 250,
      child: ClipOval(
        child: Image.asset('assets/images/mango.jpg',
        fit: BoxFit.fitWidth,
          ),
      )

    );
   }
   Widget profiledetails(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height:  100,
        width: 800,
        decoration: const  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("RIPE MANGO VARIETY",
                style: GoogleFonts.leckerliOne(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              buildrowage('COST : ',' 40'),
             buildrowage('TASTE : ', 'SWEET'),
            ],
          ),
        ),
      ),
    );
   }
   Widget buildrowage(String heading, String value){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(heading,
        style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.normal),
        ),
        Text(value,
        style: GoogleFonts.roboto(fontSize: 20),
        ),
      ],
    );
   }
   Widget profilestatus(BuildContext context){
    return Container(
      height: 100,
      width: 800,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconrow(Icons.restaurant,"Hotel",Colors.cyan),
          iconrow(Icons.favorite,"Fruit",Colors.black),
          iconrow(Icons.directions_walk,"Run",Colors.greenAccent),
        ],
      ),
    );
   }
   Widget iconrow(IconData icon,String text,Color color){
    return Column(
      children: [
        Icon(icon,
        size: 40,
          color: color,
        ),
        const SizedBox(height: 10),
        Text(text,
          style: GoogleFonts.roboto(fontSize: 35,color: Colors.orangeAccent,fontWeight: FontWeight.bold),
        ),
      ],
    );
   }
}
