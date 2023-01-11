part of 'quiz_bloc.dart';

@immutable
abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoadedSingle extends QuizState {
  const QuizLoadedSingle({
    required this.numberOfQuestions,
    required this.questions,
    required this.mode,
    this.numberOfPoints = 0,
    this.currentQuestionIndex = 0,
    this.currentQuestionAnswered = false,
    this.selectedAnswerKey = '',
    this.isCorrect = false,
    this.answerList = const [],
  });

  QuizLoadedSingle copyWith({
    int? numberOfQuestions,
    List<Question>? questions,
    Mode? mode,
    int? numberOfPoints,
    int? currentQuestionIndex,
    bool? currentQuestionAnswered,
    String? selectedAnswerKey,
    bool? isCorrect,
    List<Answer>? answerList,
  }) {
    return QuizLoadedSingle(
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      questions: questions ?? this.questions,
      mode: mode ?? this.mode,
      numberOfPoints: numberOfPoints ?? this.numberOfPoints,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      currentQuestionAnswered:
          currentQuestionAnswered ?? this.currentQuestionAnswered,
      selectedAnswerKey: selectedAnswerKey ?? this.selectedAnswerKey,
      isCorrect: isCorrect ?? this.isCorrect,
      answerList: answerList ?? this.answerList,
    );
  }

  final int numberOfQuestions;
  final List<Question> questions;
  final Mode mode;
  final int numberOfPoints;
  final int currentQuestionIndex;
  final bool currentQuestionAnswered;
  final String selectedAnswerKey;
  final bool isCorrect;
  final List<Answer> answerList;

  @override
  List<Object?> get props => [
        numberOfQuestions,
        questions,
        mode,
        numberOfPoints,
        currentQuestionIndex,
        currentQuestionAnswered,
        selectedAnswerKey,
        isCorrect,
        answerList,
      ];
}

class QuizLoading extends QuizState {}

class QuizEnded extends QuizState {
  const QuizEnded({required this.numberOfPoints});

  final int numberOfPoints;
}
