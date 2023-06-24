import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:four_gospels/models/models.dart';

class MultiPlayerService {
  final CollectionReference _roomsCollection =
      FirebaseFirestore.instance.collection('rooms').withConverter<Room>(
            fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
            toFirestore: (room, _) => room.toJson(),
          );

  Future<DocumentReference<Room>> createRoom(
    String userName,
    int numPlayers,
    int numQuestions,
    String code,
  ) async {
    final room = Room(
      users: [userName],
      code: code,
      lastInteraction: DateTime.now(),
      owner: userName,
      numberOfPlayers: numPlayers,
      numberOfQuestions: numQuestions,
    );

    final roomReference = await _roomsCollection.add(room);
    return roomReference.withConverter<Room>(
      fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
      toFirestore: (room, _) => room.toJson(),
    );
  }

  // Stream<QuerySnapshot> getRoom(String code) {
  //   return _roomsCollection.where('code', isEqualTo: code).snapshots();
  // }
}
