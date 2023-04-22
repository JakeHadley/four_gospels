import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/services/services.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc(QuizService quizService)
      : _quizService = quizService,
        super(QuizInitial()) {
    on<QuizStart>(_onQuizStart);
    on<QuizNextQuestion>(_onQuizNextQuestion);
    on<QuizAnsweredQuestion>(_onQuizAnsweredQuestion);
    on<QuizFinished>(_onQuizFinished);
  }
  final QuizService _quizService;

  Future<void> _onQuizStart(QuizStart event, Emitter<QuizState> emit) async {
    emit(QuizLoading());

    final questions = await _quizService.getQuestions(
      event.numberOfQuestions,
      event.mode,
      event.type,
    );

    emit(
      QuizLoaded(
        numberOfQuestions: event.numberOfQuestions,
        questions: questions,
        mode: event.mode,
        answerList: _buildAnswerList(questions[0]),
        type: event.type,
      ),
    );
  }

  void _onQuizNextQuestion(QuizNextQuestion event, Emitter<QuizState> emit) {
    final prevState = state as QuizLoaded;
    final numberOfPoints = prevState.isCorrect
        ? prevState.numberOfPoints + 10
        : prevState.numberOfPoints;
    final numberCorrect = prevState.isCorrect
        ? prevState.numberCorrect + 1
        : prevState.numberCorrect;
    final nextQuestionIndex = prevState.currentQuestionIndex + 1;

    if (nextQuestionIndex == prevState.numberOfQuestions) {
      emit(
        QuizEnded(
          numberOfPoints: numberOfPoints,
          numberOfQuestions: prevState.numberOfQuestions,
          numberCorrect: numberCorrect,
        ),
      );
    } else {
      emit(
        prevState.copyWith(
          numberOfPoints: numberOfPoints,
          numberCorrect: numberCorrect,
          currentQuestionIndex: nextQuestionIndex,
          currentQuestionAnswered: false,
          selectedAnswerKey: '',
          isCorrect: false,
          answerList: _buildAnswerList(prevState.questions[nextQuestionIndex]),
        ),
      );
    }
  }

  void _onQuizAnsweredQuestion(
    QuizAnsweredQuestion event,
    Emitter<QuizState> emit,
  ) {
    final prevState = state as QuizLoaded;

    emit(
      prevState.copyWith(
        currentQuestionAnswered: true,
        selectedAnswerKey: event.selectedAnswerKey,
        isCorrect: event.isCorrect,
      ),
    );
  }

  void _onQuizFinished(QuizFinished event, Emitter<QuizState> emit) {
    emit(QuizInitial());
  }

  List<Answer> _buildAnswerList(Question question) => List<Answer>.from([
        Answer(isCorrect: true, key: 'A', text: question.correctAnswer),
        Answer(isCorrect: false, key: 'B', text: question.wrongAnswer1),
        Answer(isCorrect: false, key: 'C', text: question.wrongAnswer2),
        Answer(isCorrect: false, key: 'D', text: question.wrongAnswer3),
      ])
        ..shuffle();
}
