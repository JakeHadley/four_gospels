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
    required this.questions,
    required this.mode,
    this.numberOfPoints = 0,
    this.currentQuestionIndex = 0,
  });

  QuizLoadedSingle copyWith({
    int? numberOfQuestions,
    List<Question>? questions,
    Mode? mode,
    int? numberOfPoints,
    int? currentQuestionIndex,
  }) {
    return QuizLoadedSingle(
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      questions: questions ?? this.questions,
      mode: mode ?? this.mode,
      numberOfPoints: numberOfPoints ?? this.numberOfPoints,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }

  final int numberOfQuestions;
  final List<Question> questions;
  final Mode mode;
  final int numberOfPoints;
  final int currentQuestionIndex;

  @override
  List<Object?> get props => [
        numberOfQuestions,
        questions,
        mode,
        numberOfPoints,
        currentQuestionIndex,
      ];
}

class QuizLoading extends QuizState {}
