part of 'quiz_bloc.dart';

@immutable
abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  const QuizLoaded({
    required this.numberOfQuestions,
    required this.questions,
    required this.mode,
    required this.type,
    this.numberOfPoints = 0,
    this.numberCorrect = 0,
    this.currentQuestionIndex = 0,
    this.currentQuestionAnswered = false,
    this.isCorrect = false,
    this.answerList = const [],
    this.selectedAnswer,
  });

  QuizLoaded copyWith({
    int? numberOfQuestions,
    List<Question>? questions,
    Mode? mode,
    QuizType? type,
    int? numberOfPoints,
    int? numberCorrect,
    int? currentQuestionIndex,
    bool? currentQuestionAnswered,
    bool? isCorrect,
    List<Answer>? answerList,
    Answer? selectedAnswer,
  }) {
    return QuizLoaded(
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      questions: questions ?? this.questions,
      mode: mode ?? this.mode,
      type: type ?? this.type,
      numberOfPoints: numberOfPoints ?? this.numberOfPoints,
      numberCorrect: numberCorrect ?? this.numberCorrect,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      currentQuestionAnswered:
          currentQuestionAnswered ?? this.currentQuestionAnswered,
      isCorrect: isCorrect ?? this.isCorrect,
      answerList: answerList ?? this.answerList,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }

  final int numberOfQuestions;
  final List<Question> questions;
  final Mode mode;
  final QuizType type;
  final int numberOfPoints;
  final int numberCorrect;
  final int currentQuestionIndex;
  final bool currentQuestionAnswered;
  final bool isCorrect;
  final List<Answer> answerList;
  final Answer? selectedAnswer;

  @override
  List<Object?> get props => [
        numberOfQuestions,
        questions,
        mode,
        type,
        numberOfPoints,
        numberCorrect,
        currentQuestionIndex,
        currentQuestionAnswered,
        isCorrect,
        answerList,
        selectedAnswer,
      ];
}

class QuizComplete extends QuizState {
  const QuizComplete({
    required this.numberOfQuestions,
    required this.numberCorrect,
    required this.numberOfPoints,
    required this.type,
  });

  final int numberOfPoints;
  final int numberOfQuestions;
  final int numberCorrect;
  final QuizType type;
}
