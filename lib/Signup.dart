import 'package:flutter/material.dart';
import 'Loginpage1.dart';
class SignUp extends StatefulWidget {
  String message;
  bool issignup = true;
   SignUp({Key? key, required this.message}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fnamecontroller = TextEditingController();
  final lnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const  SizedBox(height: 20,),
                const CircleAvatar(
                    radius: 100,
                    backgroundImage: const AssetImage('assets/images/boy.jpeg') ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    space(),
                   loginpag(
                       keyboardtype: TextInputType.text,
                       text: "Firstname",
                       icon: Icons.person_outline,
                       obsecure: false,
                       controller: fnamecontroller),
                    space(),
                    loginpag(
                        keyboardtype: TextInputType.text,
                        text: "Lastname",
                        icon: Icons.person_outline,
                        obsecure: false,
                        controller: lnamecontroller),
                    space(),
                   loginpag(
                       keyboardtype: TextInputType.text,
                       text: "Email",
                       icon: Icons.verified_user,
                       obsecure: false,
                       controller: emailcontroller),
                    space(),
                    loginpag(
                        keyboardtype: TextInputType.text,
                        text: "Password",
                        icon: Icons.enhanced_encryption,
                        obsecure: true,
                        controller: passwordcontroller),
                    space(),
                    button("SignUp"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget loginpag({
    required TextInputType keyboardtype,
    required String text,
    required IconData icon,
    required bool obsecure,
    required TextEditingController? controller}) {
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
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(text),
    );
  }
}
