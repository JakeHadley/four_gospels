part of 'quiz_bloc.dart';

@immutable
abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizLoadedSingle extends QuizState {
  const QuizLoadedSingle({
    required this.numberOfQuestions,
    //required this.questions,
    this.numberOfPoints = 0,
    this.currentQuestionIndex = 0,
  });

  QuizLoadedSingle copyWith({
    int? numberOfQuestions,
    //Question[]? questions,
    int? numberOfPoints,
    int? currentQuestionIndex,
  }) {
    return QuizLoadedSingle(
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      //questions: questions ?? this.questions
      numberOfPoints: numberOfPoints ?? this.numberOfPoints,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }

  final int numberOfQuestions;
  //final Question[] questions;
  final int numberOfPoints;
  final int currentQuestionIndex;

  @override
  List<Object?> get props => [
        numberOfQuestions,
        //questions
        numberOfPoints,
        currentQuestionIndex,
      ];
}

class QuizLoading extends QuizState {}
