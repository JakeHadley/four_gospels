import 'package:four_gospels/quiz/models/mode.dart';
import 'package:four_gospels/single_player_setup/models.dart';

final List<QuestionItem> questionItems = [
  const QuestionItem('10 Questions', 10),
  const QuestionItem('15 Questions', 15),
  const QuestionItem('20 Questions', 20),
  const QuestionItem('25 Questions', 25),
];

final List<ModeItem> modeItems = [
  const ModeItem('Easy', Mode.easy),
  const ModeItem('Moderate', Mode.moderate),
  const ModeItem('Hard', Mode.hard),
];
