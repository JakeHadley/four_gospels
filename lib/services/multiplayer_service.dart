import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:four_gospels/models/models.dart';

class MultiplayerService {
  final CollectionReference _roomsCollection =
      FirebaseFirestore.instance.collection('rooms').withConverter<Room>(
            fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
            toFirestore: (room, _) => room.toJson(),
          );

  Future<void> createRoom(String userName) async {
    final room = Room(
      users: [userName],
      code: 'abc123',
      lastInteraction: DateTime.now(),
      owner: userName,
    );

    await _roomsCollection.doc().set(room);
  }
}
