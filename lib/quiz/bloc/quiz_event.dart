part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
}

class QuizStart extends QuizEvent {
  const QuizStart.single({
    required this.numberOfQuestions,
    required this.mode,
    this.type = QuizType.single,
    this.questions,
  });

  const QuizStart.speed({
    required this.numberOfQuestions,
    required this.mode,
    this.type = QuizType.speed,
    this.questions,
  });

  const QuizStart.multi({
    required this.numberOfQuestions,
    required this.mode,
    this.type = QuizType.multi,
    this.questions,
  });

  final int numberOfQuestions;
  final Mode mode;
  final QuizType type;
  final List<Question>? questions;

  @override
  List<Object?> get props => [numberOfQuestions, mode, type, questions];
}

class QuizNextQuestion extends QuizEvent {}

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

class QuizEnded extends QuizEvent {}
