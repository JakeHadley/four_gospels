import 'package:cloud_firestore/cloud_firestore.dart';

class MultiplayerService {
  final CollectionReference _roomsCollection =
      FirebaseFirestore.instance.collection('rooms');
}
