part of 'quiz_bloc.dart';

@immutable
abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizLoadedSingle extends QuizState {
  const QuizLoadedSingle(this.numberOfQuestions);

  final int numberOfQuestions;

  @override
  List<Object?> get props => [numberOfQuestions];
}

class QuizLoading extends QuizState {}
