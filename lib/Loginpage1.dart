import 'package:cookbook1/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
   //String message;
   //bool islogin = true;
 LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usercontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext contexwidget) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const SizedBox(height: 20,),
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(
                      "assets/images/boy.jpeg",
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                  space(),
                  loginpag(
                      keyboardtype: TextInputType.text,
                      text: "Email",
                      icon: Icons.verified_user,
                      obsecure: false,
                      controller: usercontroller,
                  ),
                  space(),
                  loginpag(
                      keyboardtype: TextInputType.text,
                      text: "Password",
                      icon: Icons.enhanced_encryption,
                      obsecure: true,
                      controller: passwordcontroller,
                  ),
                  space(),
                  button("Login"),
                    RichText(
                    text:  TextSpan(
                      text: "Don't have an account ",
                          style: const TextStyle(fontSize: 20,color: Colors.black),
                          children: [
                            TextSpan(
                              text: "SignUp",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Colors.black87,
                              ),
                            )
                          ]
                    ),
          ),
        ],
      ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                      child:const  Text("click")),
                ],
              ),
            ),
          ),
    ));
  }

  Widget loginpag({
    required TextInputType keyboardtype,
    required String text,
    required IconData icon,
    required bool obsecure,
    required TextEditingController controller}) {
    return TextField(
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: text,
      ),
      obscureText: obsecure,
      controller: controller,
    );
  }

  Widget space() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget button(String text) {
    return ElevatedButton(
      child: Text(text),
      onPressed: () async{
       await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: usercontroller.text,
           password: passwordcontroller.text);
       setState(() {

       });
      });
  }
}
