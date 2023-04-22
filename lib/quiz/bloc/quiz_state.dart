part of 'quiz_bloc.dart';

@immutable
abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizInitial extends QuizState {}

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
    this.selectedAnswerKey = '',
    this.isCorrect = false,
    this.answerList = const [],
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
    String? selectedAnswerKey,
    bool? isCorrect,
    List<Answer>? answerList,
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
      selectedAnswerKey: selectedAnswerKey ?? this.selectedAnswerKey,
      isCorrect: isCorrect ?? this.isCorrect,
      answerList: answerList ?? this.answerList,
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
  final String selectedAnswerKey;
  final bool isCorrect;
  final List<Answer> answerList;

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
        selectedAnswerKey,
        isCorrect,
        answerList,
      ];
}

class QuizLoading extends QuizState {}

class QuizEnded extends QuizState {
  const QuizEnded({
    required this.numberOfQuestions,
    required this.numberCorrect,
    required this.numberOfPoints,
  });

  final int numberOfPoints;
  final int numberOfQuestions;
  final int numberCorrect;
}
