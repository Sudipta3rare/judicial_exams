import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judicial_exams/utils/styles.dart';
import 'package:judicial_exams/views/components/custom_button.dart';
import 'package:get/get.dart';


class MyRegister extends StatelessWidget {

  MyRegister({Key? key}) : super(key: key);

  String email = '', pass = '',phone = '',confirmPassword ='',fullname = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     // backgroundColor: AppStyle().backgroundColor,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.fromLTRB(32,50,32,0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
                opacity: 0.1
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Registration',style: GoogleFonts.montserrat(
                    color: AppStyle().button,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                ),

                SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    fullname = value;
                  },
                  decoration:  InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color:AppStyle().button),
                    border: OutlineInputBorder(borderSide: BorderSide(color: AppStyle().button),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppStyle().button), // Change focused border color to red
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
                    phone = value;
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


                SizedBox(height: 20),


                TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  onChanged: (value) {
                    confirmPassword = value;
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

                    if (fullname.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color(0xffc89ce4),
                          content: Text('Please enter a valid full name.'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color(0xffc89ce4),
                          content: Text('Please enter a valid email.'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }

                    if (phone.length != 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color(0xffc89ce4),
                          content: Text('Please enter a valid phone number.'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    if (pass.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color(0xffc89ce4),
                          content: Text('Password should be at least 6 characters long.'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    if (pass != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color(0xffc89ce4),
                          content: Text('Passwords do not match.'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    try {
                      await Firebase.initializeApp(); // Ensure Firebase is initialized
                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email,
                        password: pass,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color(0xffc89ce4),
                          content: Text('Registration Successful,Please Log in to Access Your Profile'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      //Get.offAndToNamed("home");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
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
      ),
    );
  }
}
