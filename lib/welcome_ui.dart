import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';

class Furnitures extends StatefulWidget {
  const Furnitures({ Key? key }) : super(key: key);

  @override
  _FurnituresState createState() => _FurnituresState();
}

class _FurnituresState extends State<Furnitures> with TickerProviderStateMixin {
  List<dynamic> _furnitures = [
    {
      'title': 'WELCOME TO ',
      'text': 'QUICK PARK',
      'sub_title':'      ²KEY TO SMOOTH PARKING\n'                           
      ' WITH YOUR INTELLIGENT PARTNER',
      'image':'assets/thumb-1920-1167294.jpg',
      'mid_image': 'assets/d__1_-removebg-preview (1).png' // Add this line
    },
    {
      'title': 'Modern \nFurniture',
      'sub_title': 'Choose From Thousands Of Items That Fits Your Choice.',
      'image': 'assets/car-park.jpg'
    },
    {
      'title': 'Modern \nFurniture',
      'sub_title': 'Choose From Thousands Of Items That Fits Your Choice.',
      'image': 'assets/top-view-electric-cars-parking-lot.jpg'
    },
 
  ];

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 20),
    vsync: this
  )..repeat(reverse: true);

  late final Animation<double> _animation = Tween<double>(
    begin: 1.0,
    end: 1.5
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear
  ));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (int index) {
          _controller.value = 0.0;
          _controller.forward();
        },
        itemBuilder: (context, index) {
          return Container(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(),
                  child: ScaleTransition(
                    scale: _animation,
                    child: Image.network(
                      _furnitures[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                           Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.4),
                             Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.9)
                        ]
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                    
                      children: [
                        Positioned(
                                top:0,
                                child: FadeInDown(
                                  duration: const Duration(milliseconds: 500),
                                  child: Text(_furnitures[index]['title'].split('\n')[0],
                                    style: GoogleFonts.orbitron(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          SizedBox(height:20,),
                           FadeInDown(
                        duration: const Duration(milliseconds: 500),
                        child: Image.asset(
                          _furnitures[index]['mid_image'], // Add this line
                          height: 315, // Adjust the height as needed
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45,),
                        
                       
                      SizedBox(height:100),
                        FadeInLeft(
                          delay: Duration(milliseconds: 100),
                          duration: Duration(milliseconds: 1000),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)
                              ),
                              onPressed: () {
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => loginpage()),
                                );
                              },
                              color: const Color.fromARGB(255, 0, 0, 0),
                              padding: EdgeInsets.only(right: 5, left: 30, top: 5, bottom: 5),
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Text('Get Started', 
                                      style:  GoogleFonts.orbitron(
                                      textStyle: TextStyle(
                                      
                                        color: Colors.orange.shade50, 
                                        fontSize: 16,
                                      ),
                                    ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                        borderRadius: BorderRadius.circular(40)
                                      ),
                                      child: Icon(Icons.arrow_forward, color: Colors.orange.shade100,)
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ),
                        ), 
                        SizedBox(height: 60),
                      ]
                    )
                  ),
                )
              ],
            ),
          );
          // ignore: dead_code
         
        },
        itemCount: _furnitures.length,
        controller: PageController(viewportFraction: 1.0),
        
      ),
    );
  }
}