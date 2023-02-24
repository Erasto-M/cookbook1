import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            height: 1000,
            width: 600,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Login Account",
                        style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                        Text("Hello, welcome back to account!",
                        style: TextStyle(fontSize: 15,color: Colors.black26),
                        ),
                      ],
                    ),
                   const SizedBox(width: 15,),
                   Row(
                     children:const  [
                         CircleAvatar(
                         radius:20,
                          backgroundImage: AssetImage("assets/images/usaflag.png"),
                        ),
                       Icon(Icons.arrow_drop_down_sharp),
                     ],
                   ),
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  height: 40,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                     color: Colors.black12,
                  ),
                  child: Padding(
                    padding:  const EdgeInsets.only(left: 50,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text("Email"),
                        Container(
                          height: 22,
                          width: 150,
                          child: Center(child: Text("Phone Number")),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const  Text("Phone Number"),
                   const  SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 60,
                          decoration: const BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 1),
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage('assets/images/usaflag.png'),),
                                Icon(Icons.arrow_drop_down_sharp),
                              ],
                            ),
                          ),
                        ),
                         Container(
                          height: 50,
                          width: 245,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 30,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                 Text("+01-202-555-0102",
                                 style: TextStyle(fontSize: 20),),
                                Icon(Icons.verified,color: Colors.green,),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 50,
                      width: 450,
                      child:Center(child:  Text("Send Code",
                      style: TextStyle(color: Colors.white,fontSize: 25),
                      )),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                         borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:const  [

                         Text("Sign in with Google or Facebook",
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Container(
                      height: 50,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SignInButton(
                          Buttons.Google,
                          text: "GOOGLE",
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: (){},
                      ),
                    ),
                   const   SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SignInButtonBuilder(
                          icon: (Icons.facebook),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          text: "Facebook",
                         // mini: true,
                          onPressed: (){},
                        backgroundColor: Colors.black12,
                      ),
                    ),
                 const    SizedBox(height: 40,),
                    RichText(
                      text:  TextSpan(
                          text: "Don't have an account ? ",
                          style: const TextStyle(fontSize: 20,color: Colors.black),
                          children: [
                            TextSpan(
                              text: "SignUp",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            )
                          ]
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
