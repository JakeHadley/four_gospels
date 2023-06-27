import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:four_gospels/models/models.dart';
import 'package:four_gospels/quiz/models/models.dart';
import 'package:four_gospels/services/multi_player_service.dart';

part 'multi_player_event.dart';
part 'multi_player_state.dart';

class MultiPlayerBloc extends Bloc<MultiPlayerEvent, MultiPlayerState> {
  MultiPlayerBloc({required this.multiPlayerService})
      : super(MultiPlayerInitial()) {
    on<MultiPlayerCreateRoom>(_onMultiPlayerCreateRoom);
    on<MultiPlayerRoomUpdated>(_onMultiPlayerRoomUpdated);
    on<MultiPlayerReset>(_onMultiPlayerReset);
  }

  final MultiPlayerService multiPlayerService;
  late StreamSubscription<DocumentSnapshot> _roomSubscription;

  Future<void> _onMultiPlayerCreateRoom(
    MultiPlayerCreateRoom event,
    Emitter<MultiPlayerState> emit,
  ) async {
    emit(MultiPlayerLoading());

    final roomReference = await multiPlayerService.createRoom(
      event.userName,
      event.numPlayers,
      event.numQuestions,
      event.code,
      event.mode,
    );

    _roomSubscription = roomReference.snapshots().listen(
          (snapshot) => add(MultiPlayerRoomUpdated(room: snapshot.data()!)),
        );
  }

  void _onMultiPlayerRoomUpdated(
    MultiPlayerRoomUpdated event,
    Emitter<MultiPlayerState> emit,
  ) {
    if (state is MultiPlayerLoading) {
      emit(MultiPlayerActive(room: event.room));
    } else {
      final prevState = state as MultiPlayerActive;
      emit(prevState.copyWith(room: event.room));
    }
  }

  void _onMultiPlayerReset(
    MultiPlayerReset event,
    Emitter<MultiPlayerState> emit,
  ) {
    _roomSubscription.cancel();
    emit(MultiPlayerInitial());
  }

  @override
  Future<void> close() {
    _roomSubscription.cancel();
    return super.close();
  }
}
