import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizLoading()) {
    on<QuizSinglePlayerStart>(_onQuizSinglePlayerStart);
    on<QuizSinglePlayerNextQuestion>(_onQuizSinglePlayerNextQuestion);
  }

  void _onQuizSinglePlayerStart(
    QuizSinglePlayerStart event,
    Emitter<QuizState> emit,
  ) {
    emit(QuizLoading());
    //get questions
    //send questions with the emit
    emit(
      QuizLoadedSingle(
        numberOfQuestions: event.numberOfQuestions,
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
