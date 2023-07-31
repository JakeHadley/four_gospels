import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:four_gospels/models/models.dart';
import 'package:four_gospels/quiz/models/models.dart';

class MultiPlayerService {
  final CollectionReference _roomsCollection =
      FirebaseFirestore.instance.collection('rooms').withConverter<Room>(
            fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
            toFirestore: (room, _) => room.toJson(),
          );

  Future<DocumentReference<Room>> createRoom(
    String name,
    int numPlayers,
    int numQuestions,
    String code,
    Mode mode,
  ) async {
    final room = Room(
      users: [name],
      code: code,
      lastInteraction: DateTime.now(),
      owner: name,
      numberOfPlayers: numPlayers,
      numberOfQuestions: numQuestions,
      mode: mode,
    );

    final roomReference = await _roomsCollection.add(room);
    return roomReference.withConverter<Room>(
      fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
      toFirestore: (room, _) => room.toJson(),
    );
  }

  Future<DocumentReference<Room>> joinRoom(
    String name,
    String code,
  ) async {
    DocumentReference<Room> roomReference;
    try {
      roomReference = await _getRoom(code);
    } on JoinRoomException {
      rethrow;
    }

    final roomDocument = await roomReference.get();
    final roomDocumentData = roomDocument.data()!;

    if (!roomDocumentData.users.contains(name)) {
      await roomReference.update(
        {
          'users': FieldValue.arrayUnion([name])
        },
      );
    } else {
      throw JoinRoomException('Name taken');
    }

    return roomReference;
  }

  Future<void> removeRoom(String code) async {
    final roomReference = await _getRoom(code);
    await roomReference.delete();
  }

  Future<void> removeUserFromRoom(String name, String code) async {
    final roomReference = await _getRoom(code);
    final roomDocument = await roomReference.get();
    final roomDocumentData = roomDocument.data()!;

    if (roomDocumentData.users.contains(name)) {
      await roomReference.update(
        {
          'users': FieldValue.arrayRemove([name])
        },
      );
    }
  }

  Future<DocumentReference<Room>> _getRoom(String code) async {
    final roomQuerySnapshot =
        await _roomsCollection.where('code', isEqualTo: code).get();

    if (roomQuerySnapshot.size == 1) {
      return roomQuerySnapshot.docs[0].reference.withConverter<Room>(
        fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
        toFirestore: (room, _) => room.toJson(),
      );
    } else {
      throw JoinRoomException('No room found');
    }
  }
}

class JoinRoomException implements Exception {
  JoinRoomException(this.error);

  final String error;
}
