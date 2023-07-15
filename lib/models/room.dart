import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:four_gospels/quiz/models/models.dart';

class Room {
  const Room({
    required this.users,
    required this.code,
    required this.lastInteraction,
    required this.owner,
    required this.numberOfPlayers,
    required this.numberOfQuestions,
    required this.mode,
    required this.questions,
    required this.language,
    required this.status,
  });

  Room.fromJson(Map<String, Object?> json)
      : this(
          users: convertUsersToListOfStrings(
            json['users']! as Iterable<dynamic>,
          ),
          code: json['code']! as String,
          lastInteraction: (json['lastInteraction']! as Timestamp).toDate(),
          owner: json['owner']! as String,
          numberOfPlayers: json['numberOfPlayers']! as int,
          numberOfQuestions: json['numberOfQuestions']! as int,
          mode: Mode.fromJson(json['mode']! as String),
          questions: convertQuestionstoListOfQuestions(
            json['questions']! as Iterable<dynamic>,
          ),
          language: json['language']! as String,
          status: json['status']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'users': users,
      'code': code,
      'lastInteraction': lastInteraction,
      'owner': owner,
      'numberOfPlayers': numberOfPlayers,
      'numberOfQuestions': numberOfQuestions,
      'mode': mode.toJson(),
      'questions': questions.map((question) => question.toJson()).toList(),
      'language': language,
      'status': status,
    };
  }

  static List<String> convertUsersToListOfStrings(Iterable<dynamic> users) {
    return List<String>.from(users.map((c) => c));
  }

  static List<Question> convertQuestionstoListOfQuestions(
    Iterable<dynamic> questions,
  ) {
    final questionMap = questions
        .map((question) => Question.fromJson(question as Map<String, dynamic>));
    return List<Question>.from(questionMap);
  }

  final List<String> users;
  final String code;
  final DateTime lastInteraction;
  final String owner;
  final int numberOfPlayers;
  final int numberOfQuestions;
  final Mode mode;
  final List<Question> questions;
  final String language;
  final String status;
}
