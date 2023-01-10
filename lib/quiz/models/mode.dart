import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

enum Mode {
  easy,
  moderate,
  hard;

  @override
  String toString() => toBeginningOfSentenceCase(name)!;
}
