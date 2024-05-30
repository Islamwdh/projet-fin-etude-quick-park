import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/park.dart';
 // Importez le fichier contenant votre modèle Parking

class FirebaseFirestoreParkingService implements ParkingService {
  final CollectionReference _parkingsCollection = FirebaseFirestore.instance.collection('parkings');

  @override
  Future<void> addParking(Parking parking) async {
    await _parkingsCollection.doc(parking.id).set(parking.toJson());
  }

  @override
  Stream<List<Parking>> getParkings() {
    return _parkingsCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return Parking.fromFirebase(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
