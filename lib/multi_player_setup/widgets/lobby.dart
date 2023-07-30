import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_gospels/models/models.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/multi_player_setup/widgets/widgets.dart';
import 'package:four_gospels/quiz/bloc/quiz_bloc.dart';
import 'package:four_gospels/single_player_setup/widgets/widgets.dart';

class Lobby extends StatelessWidget {
  const Lobby({
    required this.onStart,
    required this.onBack,
    required this.onMultiStateChange,
    required this.onQuizStateChange,
    super.key,
  });

  final void Function(String code) onStart;
  final VoidCallback onBack;
  final void Function(Room room) onMultiStateChange;
  final VoidCallback onQuizStateChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, quizState) {
        if (quizState is QuizLoaded) {
          onQuizStateChange();
        }
      },
      builder: (context, quizState) {
        return BlocConsumer<MultiPlayerBloc, MultiPlayerState>(
          listener: (context, multiState) {
            if (multiState is MultiPlayerActive) {
              if (multiState.room.status == 'active') {
                onMultiStateChange(multiState.room);
              }
            }
          },
          builder: (context, multiState) {
            if (multiState is MultiPlayerActive) {
              final room = multiState.room;

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GameInfo(
                          code: room.code,
                          numberOfPlayers: room.numberOfPlayers,
                          numberOfQuestions: room.numberOfQuestions,
                        ),
                        PlayerList(
                          users: room.users,
                          owner: room.owner,
                        ),
                        if (room.owner == multiState.name) ...[
                          StartButton(
                            isLoading: quizState is QuizLoading,
                            onPress: () => onStart(room.code),
                          ),
                        ] else ...[
                          Text(
                            'Waiting for the leader to start...',
                            style: theme.textTheme.displaySmall,
                            textAlign: TextAlign.center,
                          )
                              .animate(
                                onPlay: (controller) =>
                                    controller.repeat(reverse: true),
                              )
                              .fadeIn(duration: 2.seconds),
                        ],
                        const SizedBox(height: 30)
                      ],
                    ),
                  ),
                ],
              );
            }
            if (multiState is MultiPlayerRoomDeleted) {
              return SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Room no longer exists',
                        style: theme.textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50),
                    StartButton(
                      onPress: onBack,
                      isLoading: multiState is MultiPlayerLoading,
                      color: theme.primaryColor,
                      alternateText: 'Go Back',
                      alternateHeight: 65,
                      alternateTextStyle: theme.textTheme.headlineMedium,
                    ),
                  ],
                ),
              );
            }
            return const Text('Error');
          },
        );
      },
    );
  }
}
