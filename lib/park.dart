import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/paiment.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:flutter_map/flutter_map.dart';
// ignore: unused_import
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';


class ParkPage extends StatefulWidget {
  const ParkPage({Key? key}) : super(key: key);

  @override
  _ParkPageState createState() => _ParkPageState();
}

class _ParkPageState extends State<ParkPage> {
  String _location = 'Unknown';
  StreamSubscription<Position>? _positionStreamSubscription;

  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission != LocationPermission.always && permission != LocationPermission.whileInUse) {
      throw Exception('Location permissions are denied');
    }
  }

  Future<void> _startListeningToLocationUpdates() async {
    await _requestLocationPermission();
    final positionStream = Geolocator.getPositionStream();
    _positionStreamSubscription = positionStream.listen((position) async {
      final placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      final placemark = placemarks.first;

      setState(() {
        _location = '${placemark.locality}, ${placemark.country}';
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startListeningToLocationUpdates();
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(Icons.location_on),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: GoogleFonts.orbitron(
                fontSize: 12,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Text(
              _location,
              style: GoogleFonts.orbitron(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      // ... rest of the code remains the same

  
  
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular Parking',
                style: GoogleFonts.orbitron(
                  
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildParkingCard(
                      "assets/e3f642b169de47a2905ba30ef8e4e40e.jpg",
                      'CAR PRO',
                      '\$5.00 /hr',
                      5,
                      28,
                      true,
                    ),
                    const SizedBox(width: 16),
                    _buildParkingCard(
                      'assets/Parking-High-Quality-Wallpaper.jpg',
                      'EASY SPOT',
                      '\$4.50 /hr',
                      10,
                      15,
                      false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Nearby Parking',
                style: GoogleFonts.orbitron(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
              _buildParkingCard(
                'assets/wp8106568-parking-lot-wallpapers.jpg',
                'BRIDGE GATE PARK',
                '\$5.00 /hr',
                8,
                20,
                false,
              ),
                  ]
                  
                ),
                )
              ]
              )
            ],
          ),
        ),
      ),
     
    );
  }

  Widget _buildParkingCard(
    String image,
    String title,
    String price,
    int distance,
    int availableSpots,
    bool isPopular,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ParkingDetails(
              image: image,
              title: title,
              price: price,
              distance: distance,
              availableSpots: availableSpots,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                   style: GoogleFonts.orbitron(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '$distance km away',
                          style: GoogleFonts.orbitron(
                          fontSize: 12,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isPopular ?Colors.deepPurple : Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${availableSpots} spots',
                          style: GoogleFonts.orbitron(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                        ),
                      
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------
class ParkingDetails extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final int distance;
  final int availableSpots;
  
  

  const ParkingDetails({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.distance,
    required this.availableSpots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: Text(title,
         style: GoogleFonts.orbitron( fontWeight: FontWeight.bold,
        ),
      ),
      ),
      body: SingleChildScrollView(
       
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
               child: Image.asset(image),
                borderRadius: BorderRadius.circular(10), 
                ),
              const SizedBox(height: 16),
              Text(
                title,
                 style: GoogleFonts.orbitron(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$distance km away',
               style: GoogleFonts.orbitron(
                  fontSize: 12,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.location_pin),
                  const SizedBox(width: 8),
                  Text(
                    '1012 Ocean avanue, New yourk, USA',
                    style: GoogleFonts.orbitron(
                        fontSize: 12,
                        color: Color.fromARGB(255, 63, 180, 9),
                      ),
                    ),
                 
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Description',
                style: GoogleFonts.orbitron(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Modern and secure car park designed to meet the varied needs of motorists. Strategically located',
               style: GoogleFonts.orbitron(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Features',
               style: GoogleFonts.orbitron(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.security),
                      const SizedBox(width: 8),
                      Text(
                        '24/7 Security',
                        style: GoogleFonts.orbitron(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.camera),
                      const SizedBox(width: 8),
                      Text(
                        'CCTV Surveillance',
                        style: GoogleFonts.orbitron(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.lightbulb),
                      const SizedBox(width: 8),
                      Text(
                        'Well-lit Parking Lot',
                        style: GoogleFonts.orbitron(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Availability',
                style: GoogleFonts.orbitron(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.local_parking),
                  const SizedBox(width: 8),
                  Text(
                    '$availableSpots spots available',
                    style: GoogleFonts.orbitron(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Price',
                style: GoogleFonts.orbitron(
                  fontSize: 20,
                   color: Color.fromARGB(255, 63, 180, 9),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Center(
             child : Container(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                   Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PaymentPage()),
                                  );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text('Book Slot',
                    style: GoogleFonts.orbitron(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
)
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Parking {
  String id;
  String title;
  String image;
  String price;
  int distance;
  int availableSpots;

  Parking({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.distance,
    required this.availableSpots,
  });
  factory Parking.fromFirebase(Map<String, dynamic> data) {
    return Parking(
      id: data['id'],
      title: data['title'],
      image: data['imageUrl'],
      price: data['price'],
      distance: data['distance'],
      availableSpots: data['availableSpots'],
    );
  }

   factory Parking.fromJson(Map<String, dynamic> json) {
    return Parking(
      id: json['id'],
      title: json['title'],
      image: json['imageUrl'],
      price: json['price'],
      distance: json['distance'],
      availableSpots: json['availableSpots'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': image,
      'price': price,
      'distance': distance,
      'availableSpots': availableSpots,
    };
  }
}

abstract class ParkingService {
  Future<void> addParking(Parking parking);
  Stream<List<Parking>> getParkings();
}

class FirebaseRealtimeDatabaseParkingService implements ParkingService {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  @override
  Future<void> addParking(Parking parking) async {
    await _databaseReference.child('parkings/${parking.id}').set(parking.toJson());
  }

  @override
  Stream<List<Parking>> getParkings() {
    return _databaseReference.child('parkings').onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) return [];
      return data.values.map((value) => Parking.fromFirebase(value as Map<String, dynamic>)).toList();
    });
  }
}

class FirebaseFirestoreParkingService implements ParkingService {
  final CollectionReference _parkingsCollection = FirebaseFirestore.instance.collection('parkings');

  @override
  Future<void> addParking(Parking parking) async {
    await _parkingsCollection.doc(parking.id).set(parking.toJson());
  }
  

  @override
Stream<List<Parking>> getParkings() {
  return _parkingsCollection.snapshots().map((querySnapshot) {
    return querySnapshot.docs.map((doc) => Parking.fromJson(doc.data() as Map<String, dynamic>)).toList();
  });
}


}



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const ParkPage(),
    );
  }
}