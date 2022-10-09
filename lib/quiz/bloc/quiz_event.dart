part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
}

class QuizSinglePlayerStart extends QuizEvent {
  const QuizSinglePlayerStart(this.numberOfQuestions, this.mode);

  final int numberOfQuestions;
  final Mode mode;

  @override
  List<Object?> get props => [numberOfQuestions, mode];
}

class QuizSinglePlayerNextQuestion extends QuizEvent {
  const QuizSinglePlayerNextQuestion({required this.correct});

  final bool correct;

  @override
  List<Object?> get props => [correct];
}
