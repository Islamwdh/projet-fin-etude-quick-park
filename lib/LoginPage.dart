import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/SignUpPage.dart';
import 'package:flutter_application_2/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: must_be_immutable
class loginpage extends StatelessWidget {
final auth = FirebaseAuth.instance;
late String email;
late String password;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(9, 70, 1, 1),
              Color.fromRGBO(11, 105, 8, 0.922),
              Color.fromRGBO(47, 131, 36, 1)
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: Padding(
                      padding: EdgeInsets.only(left: 45), // Adjust this value to move the text to the left
                      child: Text(
                        "LOGIN",
                        style: GoogleFonts.orbitron(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60, // Adjust the height as needed
                  width: 2, // Adjust the width of the line
                  color: Colors.white,
                ),
                Expanded(
                  child: FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: Padding(
                      padding: EdgeInsets.only(right: 20), // Adjust this value to move the logo to the right
                      child: Image.asset(
                        'assets/d__1_-removebg-preview (1).png', // Replace with your logo path
                        height: 150, // Adjust the height as needed
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                   
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30),
                      FadeInUp(
                        duration: Duration(milliseconds: 1400),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(10, 10)
                              )
                            ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Email or Phone Number",
                                  style: GoogleFonts.orbitron(
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey.shade200)
                                  )
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter your email or phone number",
                                    hintStyle: GoogleFonts.orbitron(
                                      textStyle: TextStyle(
                                        color: Colors.grey
                                      ),
                                    ),
                                    border: InputBorder.none
                                  ),
                                ),
                              ),
                              SizedBox(height: 10), // Space between email and password fields
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  "Password",
                                  style: GoogleFonts.orbitron(
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey.shade200)
                                  )
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Enter your password",
                                    hintStyle: GoogleFonts.orbitron(
                                      textStyle: TextStyle(
                                        color: Colors.grey
                                      ),
                                    ),
                                    border: InputBorder.none,
                                     
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      SizedBox(height: 30),
                      FadeInUp(
                        duration: Duration(milliseconds: 1500),
                        child: Text(
                          "FORGOT PASSWORD?",
                          style: GoogleFonts.orbitron(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: MaterialButton(
                          onPressed: () async{
                          try{
                            var user =  await auth.signInWithEmailAndPassword(email: email, password: password);
                            // ignore: unnecessary_null_comparison
                            if(user !=null) {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => home()),
                            );
                            }
                          }
                          catch(e){
                            print(e);
                          }
                            
                          },
                          height: 50,
                          color: Color.fromARGB(255, 59, 218, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.orbitron(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        )
                      ),
                      SizedBox(height: 18),
                      FadeInUp(
                        duration: Duration(milliseconds: 1700),
                        child: Text(
                          "YOU DO NOT HAVE ACCOUNT?",
                          style: GoogleFonts.orbitron(
                            textStyle: TextStyle(
                              fontSize: 12, // Updated font size
                              color: Colors.grey
                            ),
                          ),
                        )
                      ),
                      SizedBox(height: 18),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FadeInUp(
                              duration: Duration(milliseconds: 1800),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignupPage()),
                                  );
                                },
                                height: 50,
                                color: Colors.orange[900],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    "SIGN UP",
                                    style: GoogleFonts.orbitron(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
