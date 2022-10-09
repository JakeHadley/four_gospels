import 'package:four_gospels/quiz/models/mode.dart';

class Item {
  const Item(this.text);

  final String text;
}

class QuestionItem extends Item {
  const QuestionItem(super.text, this.num);

  final int num;
}

class ModeItem extends Item {
  const ModeItem(super.text, this.mode);

  final Mode mode;
}
