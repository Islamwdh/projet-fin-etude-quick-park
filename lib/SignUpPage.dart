import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_2/verification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
final auth= FirebaseAuth.instance;
var showpass = true;
late String email;
late String firstname;
late String lastname;
late String password;
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400
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
                        "SIGN UP",
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
                                  onChanged: (value){
                                      email = value ;
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
                                  "First Name",
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
                                  onChanged: (value){
                                      firstname = value ;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "First Name",
                                    hintStyle: GoogleFonts.orbitron(
                                      textStyle: TextStyle(
                                        color: Colors.grey
                                      ),
                                    ),
                                    border: InputBorder.none,
                                     
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  "Last Name",
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
                                  onChanged: (value){
                                      lastname = value ;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Last Name",
                                    hintStyle: GoogleFonts.orbitron(
                                      textStyle: TextStyle(
                                        color: Colors.grey
                                      ),
                                    ),
                                    border: InputBorder.none,
                                     
                                  ),
                                ),
                              ),
                              SizedBox(height: 10), // Space between email and password fields
                              
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
                                  onChanged: (value){
                                      password = value ;
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
                              SizedBox(height: 10), // Space between email and password fields
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  "Confirm Password",
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
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
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
                      SizedBox(height: 18),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FadeInUp(
                              duration: Duration(milliseconds: 1800),
                              child: MaterialButton(
                                onPressed: () async{
                                 // ignore: unused_local_variable
                                 try{ var user = await auth.createUserWithEmailAndPassword(email: email, password: password);
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Verification()));
                                 }
                                catch(e){
                                  print('error');
                                }

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
                                        color: const Color.fromARGB(255, 7, 5, 5),
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                        FadeInUp(duration: Duration(milliseconds: 1700), child: Text("Continue with social media", style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 30,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FadeInUp(duration: Duration(milliseconds: 1800), child: MaterialButton(
                                onPressed: (){},
                                height: 50,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child: FadeInUp(duration: Duration(milliseconds: 1900), child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Verification()),
                                  );
                                },
                                height: 50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),

                                ),
                                color: const Color.fromARGB(255, 206, 0, 0),
                                child: Center(
                                  child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )),
                            )
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
      ),
    );
  }
  
  void setState(Null Function() param0) {}
  
  find() {}
}
              