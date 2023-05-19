import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:judicial_exams/utils/styles.dart';
import 'package:judicial_exams/views/components/custom_button.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/views/slider_pages/Slider1.dart';

class MyRegister extends StatelessWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '', pass = '';
    return Scaffold(
     // backgroundColor: AppStyle().backgroundColor,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SvgPicture.asset(
              //
              //       width: MediaQuery.of(context).size.width,
              //       height:400,
              //       "assets/signUp.svg"),
              // ),

              SizedBox(height: 150),

              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Full Name',
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
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Phone',
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
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
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


              SizedBox(height: 20),


              TextField(
                onChanged: (value) {
                  pass = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
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
                    await Firebase.initializeApp(); // Ensure Firebase is initialized
                    UserCredential userCredential =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: pass,
                    );
                    Navigator.pushNamed(context, 'home');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: CustomButton().customButton200(context, 'Sign Up'),
              ),
            SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => Get.offAndToNamed('login'),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color(0xff3e1558),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
