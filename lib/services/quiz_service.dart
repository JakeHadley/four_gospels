import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizService {
  final CollectionReference _questionsCollection = FirebaseFirestore.instance
      .collection('questionsPor')
      .withConverter<Question>(
        fromFirestore: (snapshot, _) => Question.fromJson(snapshot.data()!),
        toFirestore: (question, _) => question.toJson(),
      );

  final CollectionReference _statsCollection =
      FirebaseFirestore.instance.collection('stats');

  Future<List<String>> _getIds(
    Stats stats,
    Mode mode,
    int numberOfQuestions,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    var usedIdsByMode = prefs.getStringList(mode.toString());
    if (usedIdsByMode == null) {
      final randomIds =
          (stats[mode].ids..shuffle()).take(numberOfQuestions).toList();
      await prefs.setStringList(mode.toString(), randomIds);
      return randomIds;
    } else {
      // if full list length minus the used length is less than numQuestions
      // if (600-595 < 10)
      // if (5 < 10)
      if (stats[mode].ids.length - usedIdsByMode.length < numberOfQuestions) {
        usedIdsByMode = List<String>.empty();
      }
      final usedIdsByModeSet = Set<String>.from(usedIdsByMode);
      final idsSet = Set<String>.from(stats[mode].ids);
      final randomIds = (List<String>.from(idsSet.difference(usedIdsByModeSet))
            ..shuffle())
          .take(numberOfQuestions)
          .toList();

      usedIdsByMode = usedIdsByMode + randomIds;

      await prefs.setStringList(mode.toString(), usedIdsByMode);

      return randomIds;
    }
  }

  Future<List<Question>> _getQuestionsList(List<String> ids) async {
    final futureQuerySnapshotList =
        List<Future<QuerySnapshot>>.empty(growable: true);
    final questionList = List<Question>.empty(growable: true);

    for (final id in ids) {
      futureQuerySnapshotList.add(
        _questionsCollection.where('id', isEqualTo: int.parse(id)).get(),
      );
    }
    final querySnapshotList = await Future.wait([...futureQuerySnapshotList]);

    for (final snap in querySnapshotList) {
      if (snap.docs.isNotEmpty) {
        questionList.add(snap.docs.first.data()! as Question);
      }
    }
    return questionList;
  }

  Future<List<Question>> getQuestions(
    int numberOfQuestions,
    Mode mode,
    QuizType type,
  ) async {
    final statsCollection = await _statsCollection.doc('questionsPor').get();

    if (statsCollection.data() != null) {
      final stats =
          Stats.fromJson(statsCollection.data()! as Map<String, dynamic>);

      var ids = <String>[];
      if (type == QuizType.speed) {
        ids = await Future.wait([
          _getIds(stats, Mode.easy, 20),
          _getIds(stats, Mode.moderate, 20),
          _getIds(stats, Mode.hard, 20),
          // flatten list of ids to be one list
        ]).then((results) => results.expand((idsList) => idsList).toList());
      } else {
        ids = await _getIds(stats, mode, numberOfQuestions);
      }
      final questionsList = await _getQuestionsList(ids);

      return questionsList;
    } else {
      throw Exception('Could not get Questions');
    }
  }
}
