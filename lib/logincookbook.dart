// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// class loginscreen1 extends StatefulWidget {
//   const loginscreen1({Key? key}) : super(key: key);
//
//   @override
//   State<loginscreen1> createState() => _loginscreen1State();
// }
// class _loginscreen1State extends State<loginscreen1> {
//
//   String _message ='';
//   bool islogin = true;
//   final usernamecontroller = TextEditingController();
//   final passcontrpller = TextEditingController();
//   FirebaseAuth auth;
//
//   @override
//   void initState() {
//     Firebase.initializeApp().whenComplete(() {
//       auth = FirebaseAuth.instance;
//       setState(() {});
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:  Text("LoginScreen",
//         style: GoogleFonts.leckerliOne(fontWeight: FontWeight.bold,fontSize: 20,
//         color: Colors.white,
//         ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               userinput(),
//               Space(),
//               password(),
//               Space(),
//               btmain(),
//               Space(),
//               secondbutton(),
//               Space(),
//               textmessage(),
//               Space(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget userinput(){
//     return Padding(
//       padding: const EdgeInsets.only(top: 128),
//       child: TextFormField(
//         controller: usernamecontroller,
//         keyboardType: TextInputType.emailAddress,
//         decoration: const InputDecoration(
//           hintText: "Username",
//           icon: Icon(Icons.verified_user),
//         ),
//         validator: (text) => text!.isEmpty ? 'username is required': "",
//       ),
//     );
//   }
//   Widget password(){
//     return Padding(
//       padding: const EdgeInsets.only(top: 24),
//       child: TextFormField(
//         keyboardType: TextInputType.text,
//         controller: passcontrpller,
//         decoration: const InputDecoration(
//           hintText: "Password",
//           icon: Icon(Icons.enhanced_encryption),
//         ),
//         obscureText: true,
//         validator: (text) => text!.isEmpty? 'password is required':"",
//       ),
//     );
//   }
//
//   Widget btmain(){
//     String btntext = islogin? "log in":"Sign Up";
//     return Padding(
//       padding:  EdgeInsets.only(top: 128),
//       child: Container(
//         height: 160,
//         child: ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(
//               Theme.of(context).primaryColorLight),
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(24),
//                 side: BorderSide(color: Colors.red),
//               ),
//             )
//           ),
//           onPressed: (){},
//           child: Text(
//             btntext,
//             style: TextStyle(
//               color: Theme.of(context).primaryColorLight,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   Widget secondbutton(){
//     String buttontext = islogin? "sign up":"log in";
//     return TextButton(
//         onPressed: (){
//           setState(() {
//             islogin =!islogin;
//           });
//         },
//         child: Text(buttontext,
//         )
//     );
//   }
//   Widget textmessage(){
//     return Text(
//       _message,
//       style: TextStyle(
//         color: Theme.of(context).primaryColorDark,
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
//   Widget Space(){
//     return const SizedBox(
//       height: 10,
//     );
//   }
// }
