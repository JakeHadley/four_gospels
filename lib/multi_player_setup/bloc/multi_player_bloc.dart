import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:four_gospels/models/models.dart';
import 'package:four_gospels/services/multi_player_service.dart';

part 'multi_player_event.dart';
part 'multi_player_state.dart';

class MultiPlayerBloc extends Bloc<MultiPlayerEvent, MultiPlayerState> {
  MultiPlayerBloc({required this.multiPlayerService})
      : super(MultiPlayerInitial()) {
    on<MultiPlayerCreateRoom>(_onMultiPlayerCreateRoom);
    on<MultiPlayerRoomUpdated>(_onMultiPlayerRoomUpdated);
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
    );

    _roomSubscription = roomReference.snapshots().listen(
          (snapshot) => add(MultiPlayerRoomUpdated(room: snapshot.data()!)),
        );
  }

  void _onMultiPlayerRoomUpdated(
    MultiPlayerRoomUpdated event,
    Emitter<MultiPlayerState> emit,
  ) {
    emit(MultiPlayerActive(room: event.room));
  }

  @override
  Future<void> close() {
    _roomSubscription.cancel();
    return super.close();
  }
}
