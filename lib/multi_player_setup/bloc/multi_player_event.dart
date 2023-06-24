part of 'multi_player_bloc.dart';

abstract class MultiPlayerEvent extends Equatable {
  const MultiPlayerEvent();

  @override
  List<Object> get props => [];
}

class MultiPlayerCreateRoom extends MultiPlayerEvent {
  const MultiPlayerCreateRoom({
    required this.userName,
    required this.numPlayers,
    required this.numQuestions,
    required this.code,
  });

  final String userName;
  final int numPlayers;
  final int numQuestions;
  final String code;
}

class MultiPlayerRoomUpdated extends MultiPlayerEvent {
  const MultiPlayerRoomUpdated({required this.room});

  final Room room;
}
