import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:judicial_exams/password_reset.dart';
import 'package:judicial_exams/utils/styles.dart';
import 'package:judicial_exams/views/components/custom_button.dart';

//   ->  "//" -Indicate Circular Progressbar  code

class MyLogin extends StatefulWidget {
  MyLogin({Key? key}) : super(key: key);

//
  @override
  _MyLoginState createState() => _MyLoginState();
}

//
class _MyLoginState extends State<MyLogin> {
  String email = '';
  String pass = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  //
                  "assets/login.svg",
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                ),
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color(0xff3e1558)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3e1558)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3e1558)),
                  ),
                  fillColor: Colors.white,
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
                  labelStyle: TextStyle(color: Color(0xff3e1558)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3e1558)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3e1558)),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                      .hasMatch(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Color(0xffc89ce4),
                        content: Text('Please enter a valid email.'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else if (pass.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Color(0xffc89ce4),
                        content: Text('Password field cannot be empty.'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await Firebase.initializeApp();
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                        email: email,
                        password: pass,
                      );
                      //
                      Get.offAndToNamed("home");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color(0xffc89ce4),
                          content: Text('Login Successful'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
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
                            content:
                                Text('Wrong password provided for that user.'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }

                      ///
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                },
                child: Visibility(
                  visible: !isLoading,
                  child: CustomButton().customButton200(context, 'Login'),
                  replacement:
                      CircularProgressIndicator(color: AppStyle().button),
                ),
              ),
              SizedBox(height: 30),
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
              GestureDetector(
                //
                onTap: () => Get.to(() => PasswordActivity()),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: Color(0xff3e1558), fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
