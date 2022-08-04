import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizLoading()) {
    on<QuizSinglePlayerStart>(_onQuizSinglePlayerStart);
  }

  void _onQuizSinglePlayerStart(
    QuizSinglePlayerStart event,
    Emitter<QuizState> emit,
  ) {
    emit(QuizLoading());
    emit(QuizLoadedSingle(event.numberOfQuestions));
  }
}
