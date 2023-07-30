import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:four_gospels/models/models.dart';
import 'package:four_gospels/quiz/models/models.dart';

class MultiPlayerService {
  final CollectionReference _roomsCollection =
      FirebaseFirestore.instance.collection('rooms').withConverter<Room>(
            fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
            toFirestore: (room, _) => room.toJson(),
          );
  final FirebaseFunctions functions = FirebaseFunctions.instance;

  Future<DocumentReference<Room>> createRoom(
    String name,
    int numPlayers,
    int numQuestions,
    String code,
    Mode mode,
    String language,
  ) async {
    final room = Room(
      users: [name],
      code: code,
      lastInteraction: DateTime.now(),
      owner: name,
      numberOfPlayers: numPlayers,
      numberOfQuestions: numQuestions,
      mode: mode,
      questions: List<Question>.empty(),
      language: language,
      status: 'inactive',
      usersAnswered: [],
      currentQuestionIndex: 0,
      scores: [],
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

  Future<void> getQuestions(String code) async {
    final getQuestions = GetQuestions(code: code);
    await functions
        .httpsCallable('getQuestions')
        .call<void>(getQuestions.toJson());
  }

  Future<void> addUserAnswered(String code, String name) async {
    final roomReference = await _getRoom(code);

    await roomReference.update({
      'usersAnswered': FieldValue.arrayUnion([name])
    });
  }

  Future<void> moveToNextQuestion(String code) async {
    final roomReference = await _getRoom(code);

    await roomReference.update({
      'usersAnswered': [],
      'currentQuestionIndex': FieldValue.increment(1),
    });
  }

  Future<void> addScore(
    String code,
    Score score,
  ) async {
    final roomReference = await _getRoom(code);

    await roomReference.update({
      'scores': FieldValue.arrayUnion([score.toJson()])
    });
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

class GetQuestions {
  GetQuestions({required this.code});

  final String code;

  Map<String, Object?> toJson() {
    return {
      'code': code,
    };
  }
}

class JoinRoomException implements Exception {
  JoinRoomException(this.error);

  final String error;
}
