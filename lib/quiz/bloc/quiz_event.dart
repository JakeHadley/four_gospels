part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
}

class QuizStart extends QuizEvent {
  const QuizStart.single(
    this.numberOfQuestions,
    this.mode, {
    this.type = QuizType.single,
  });

  const QuizStart.speed(
    this.numberOfQuestions,
    this.mode, [
    this.type = QuizType.speed,
  ]);

  final int numberOfQuestions;
  final Mode mode;
  final QuizType type;

  @override
  List<Object?> get props => [numberOfQuestions, mode, type];
}

class QuizNextQuestion extends QuizEvent {
  const QuizNextQuestion();

  @override
  List<Object?> get props => [];
}

class QuizAnswerSubmitted extends QuizEvent {
  const QuizAnswerSubmitted({
    required this.isCorrect,
  });

  final bool isCorrect;
  @override
  List<Object?> get props => [isCorrect];
}

class QuizFinished extends QuizEvent {}

class QuizAnswerSelected extends QuizEvent {
  const QuizAnswerSelected({
    required this.answer,
  });

  final Answer answer;

  @override
  List<Object?> get props => [answer];
}
