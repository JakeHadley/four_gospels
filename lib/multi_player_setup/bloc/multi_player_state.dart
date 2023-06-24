part of 'multi_player_bloc.dart';

abstract class MultiPlayerState extends Equatable {
  const MultiPlayerState();

  @override
  List<Object> get props => [];
}

class MultiPlayerInitial extends MultiPlayerState {}

class MultiPlayerActive extends MultiPlayerState {
  const MultiPlayerActive({required this.room});

  final Room room;
}

class MultiPlayerLoading extends MultiPlayerState {}
