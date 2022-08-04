part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
}

class QuizSinglePlayerStart extends QuizEvent {
  const QuizSinglePlayerStart(this.numberOfQuestions);

  final int numberOfQuestions;

  @override
  List<Object?> get props => [numberOfQuestions];
}
