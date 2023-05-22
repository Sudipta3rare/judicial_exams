import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/views/components/custom_button.dart';


class MyLogin extends StatelessWidget {
  MyLogin({Key? key}) : super(key: key);

  String email = '', pass = '';

  @override
  Widget build(BuildContext context) {

      return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(32,0,32,0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
              opacity: 0.1
          ),
        ),

        // margin: EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(

                    width: MediaQuery.of(context).size.width,
                    height:400,
                    "assets/login.svg"),
              ),

              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                  //fillColor: Color(0xFFEDEDED),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color(0xff3e1558)),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff3e1558)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3e1558)), // Change focused border color to red
                  ),
                  fillColor: Colors.white,  // Set the background color to white
                  filled: true,
                ),
              ),

              SizedBox(height: 20),

              TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                onChanged: (value) {
                  pass = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Color(0xff3e1558)), // Change label text color to red
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3e1558)), // Change border color to red
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3e1558)), // Change focused border color to red
                  ),
                  fillColor: Colors.white,  // Set the background color to white
                  filled: true,
                ),
              ),


              SizedBox(height: 40),

              GestureDetector(
                onTap: () async {
                  try {
                    await Firebase.initializeApp();
                    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: pass,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Color(0xffc89ce4),
                        content: Text('Login Successful'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    Navigator.pushNamed(context, 'home');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color(0xffc89ce4),
                          content: Text('No user found for that email.'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    } else if (e.code == 'wrong-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color(0xffc89ce4),
                          content: Text('Wrong password provided for that user.'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                },
                child: CustomButton().customButton200(context, 'Login'),
                ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Does not have an account?"),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => Get.offAndToNamed('register'),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xff3e1558),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
