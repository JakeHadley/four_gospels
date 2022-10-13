import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:four_gospels/home/home.dart';
import 'package:four_gospels/quiz/quiz.dart';
import 'package:four_gospels/singlePlayerSetup/single_player_setup.dart';

part 'auto_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: SinglePlayerSetupPage),
    AutoRoute(page: QuizPage)
  ],
)
class AppRouter extends _$AppRouter {}
