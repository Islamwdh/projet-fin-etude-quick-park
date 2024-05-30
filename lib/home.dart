
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/park.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:flutter_map/flutter_map.dart';
// ignore: unused_import
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class home extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<home> {
  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions = <Widget>[
    ParkPage(),
    MapSample(),
    Text('About Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
            'QUICK PARK',
            style: GoogleFonts.orbitron(
             textStyle:TextStyle(
              fontSize: 24, // Font size
              fontWeight: FontWeight.bold, // Font weight
              color: const Color.fromARGB(255, 0, 0, 0), // Text color
              letterSpacing: 1.2, // Letter spacing
              
                     ),
               ),
          ), 
           actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
         
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile',
              style: GoogleFonts.orbitron(
             textStyle:TextStyle(
              fontSize: 15, // Font size
              fontWeight: FontWeight.bold, // Font weight
              color: const Color.fromARGB(255, 0, 0, 0), // Text color
              letterSpacing: 1.2, // Letter spacing
                     ),
               ),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Profile screen
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payment',
               style: GoogleFonts.orbitron(
                            textStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Payment screen
              },
            ),
            ListTile(
              leading: Icon(Icons.more),
              title: Text('Another Button',
               style: GoogleFonts.orbitron(
                            textStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
              ),
              onTap: () {
                Navigator.pop(context);
                // Handle another button action
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_parking),
            label: 'Park',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
         selectedLabelStyle: GoogleFonts.orbitron(
                            textStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
      unselectedLabelStyle: GoogleFonts.orbitron(
      textStyle: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 15,
       fontWeight: FontWeight.bold
        ),
           ),
        onTap: _onItemTapped,
      ),
    );
  }
}

//Home page-----------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('TO THE PARK'),
        icon: const Icon(Icons.directions),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}