import 'package:four_gospels/l10n/l10n.dart';

enum Mode {
  easy,
  moderate,
  hard,
  random;

  String toJson() => name;
  static Mode fromJson(String json) {
    var jsonString = json.toLowerCase();
    if (jsonString == 'difficult') {
      jsonString = 'hard';
    }

    return values.byName(jsonString);
  }

  String toStringIntl(AppLocalizations l10n) {
    if (name == easy.name) {
      return l10n.difficultyEasy;
    } else if (name == moderate.name) {
      return l10n.difficultyModerate;
    } else if (name == hard.name) {
      return l10n.difficultyHard;
    } else if (name == random.name) {
      //TODO: translate
      return 'Random';
    }
    return '';
  }
}
