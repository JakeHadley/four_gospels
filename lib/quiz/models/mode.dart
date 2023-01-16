import 'package:four_gospels/l10n/l10n.dart';

enum Mode {
  easy,
  moderate,
  hard;

  String toStringIntl(AppLocalizations l10n) {
    if (name == easy.name) {
      return l10n.difficultyEasy;
    } else if (name == moderate.name) {
      return l10n.difficultyModerate;
    } else if (name == hard.name) {
      return l10n.difficultyHard;
    }
    return '';
  }
}
