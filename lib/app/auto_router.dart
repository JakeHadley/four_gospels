import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:four_gospels/home/home.dart';
import 'package:four_gospels/multi_player_setup/multi_player_setup.dart';
import 'package:four_gospels/quiz/quiz.dart';
import 'package:four_gospels/single_player_setup/single_player_setup.dart';
import 'package:four_gospels/speed_setup/speed_setup.dart';

part 'auto_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: DifficultyOptionsPage),
    AutoRoute(page: NumberQuestionsPage),
    AutoRoute(page: ConfirmSettingsPage),
    AutoRoute(page: QuizPage),
    AutoRoute(page: EndGamePage),
    AutoRoute(page: SpeedSetupPage),
    AutoRoute(page: MultiPlayerSetupPage),
    AutoRoute(page: JoinGamePage),
    AutoRoute(page: CreateGamePage),
    AutoRoute(page: LobbyPage),
  ],
)
class AppRouter extends _$AppRouter {}
