import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/models/models.dart';

String getTitle(QuizType type, AppLocalizations l10n) {
  switch (type) {
    case QuizType.single:
      return l10n.singlePlayerAppBar;
    case QuizType.speed:
      return l10n.speedRoundAppBar;
    case QuizType.multi:
      return l10n.multiPlayerAppBar;
  }
}
