part of 'multi_player_bloc.dart';

abstract class MultiPlayerEvent extends Equatable {
  const MultiPlayerEvent();

  @override
  List<Object> get props => [];
}

class MultiPlayerCreateRoom extends MultiPlayerEvent {
  const MultiPlayerCreateRoom({
    required this.name,
    required this.numPlayers,
    required this.numQuestions,
    required this.code,
    required this.mode,
  });

  final String name;
  final int numPlayers;
  final int numQuestions;
  final String code;
  final Mode mode;

  @override
  List<Object> get props => [name, numPlayers, numQuestions, code, mode];
}

class MultiPlayerUpdateRoom extends MultiPlayerEvent {
  const MultiPlayerUpdateRoom({required this.room});

  final Room room;

  @override
  List<Object> get props => [room];
}

class MultiPlayerReset extends MultiPlayerEvent {}

class MultiPlayerJoinRoom extends MultiPlayerEvent {
  const MultiPlayerJoinRoom({
    required this.name,
    required this.code,
  });

  final String name;
  final String code;

  @override
  List<Object> get props => [name, code];
}

class MultiPlayerDeleteRoom extends MultiPlayerEvent {}
