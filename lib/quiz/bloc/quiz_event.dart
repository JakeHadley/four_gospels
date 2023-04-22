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

class QuizAnsweredQuestion extends QuizEvent {
  const QuizAnsweredQuestion({
    required this.selectedAnswerKey,
    required this.isCorrect,
  });

  final String selectedAnswerKey;
  final bool isCorrect;
}

class QuizFinished extends QuizEvent {}
