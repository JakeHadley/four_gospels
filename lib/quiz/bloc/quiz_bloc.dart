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
        super(QuizLoading()) {
    on<QuizSinglePlayerStart>(_onQuizSinglePlayerStart);
    on<QuizSinglePlayerNextQuestion>(_onQuizSinglePlayerNextQuestion);
  }
  final QuizService _quizService;

  Future<void> _onQuizSinglePlayerStart(
    QuizSinglePlayerStart event,
    Emitter<QuizState> emit,
  ) async {
    emit(QuizLoading());

    final questions = await _quizService.getQuestions(
      event.numberOfQuestions,
      event.mode,
    );

    emit(
      QuizLoadedSingle(
        numberOfQuestions: event.numberOfQuestions,
        questions: questions,
        mode: event.mode,
      ),
    );
  }

  void _onQuizSinglePlayerNextQuestion(
    QuizSinglePlayerNextQuestion event,
    Emitter<QuizState> emit,
  ) {
    final prevState = state as QuizLoadedSingle;
    final numberOfPoints = event.correct
        ? prevState.numberOfPoints + 10
        : prevState.numberOfPoints;

    emit(
      prevState.copyWith(
        currentQuestionIndex: prevState.currentQuestionIndex + 1,
        numberOfPoints: numberOfPoints,
      ),
    );
  }
}
