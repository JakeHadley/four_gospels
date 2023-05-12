// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'auto_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    DifficultyOptionsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DifficultyOptionsPage(),
      );
    },
    NumberQuestionsRoute.name: (routeData) {
      final args = routeData.argsAs<NumberQuestionsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NumberQuestionsPage(
          key: args.key,
          mode: args.mode,
        ),
      );
    },
    ConfirmSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmSettingsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ConfirmSettingsPage(
          key: args.key,
          mode: args.mode,
          numberQuestions: args.numberQuestions,
        ),
      );
    },
    QuizRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const QuizPage(),
      );
    },
    EndGameRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EndGamePage(),
      );
    },
    SpeedSetupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SpeedSetupPage(),
      );
    },
    MultiPlayerSetupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MultiPlayerSetupPage(),
      );
    },
    JoinGameRoute.name: (routeData) {
      final args = routeData.argsAs<JoinGameRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: JoinGamePage(
          key: args.key,
          name: args.name,
        ),
      );
    },
    CreateGameRoute.name: (routeData) {
      final args = routeData.argsAs<CreateGameRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CreateGamePage(
          key: args.key,
          name: args.name,
        ),
      );
    },
    LobbyRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LobbyPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          DifficultyOptionsRoute.name,
          path: '/difficulty-options-page',
        ),
        RouteConfig(
          NumberQuestionsRoute.name,
          path: '/number-questions-page',
        ),
        RouteConfig(
          ConfirmSettingsRoute.name,
          path: '/confirm-settings-page',
        ),
        RouteConfig(
          QuizRoute.name,
          path: '/quiz-page',
        ),
        RouteConfig(
          EndGameRoute.name,
          path: '/end-game-page',
        ),
        RouteConfig(
          SpeedSetupRoute.name,
          path: '/speed-setup-page',
        ),
        RouteConfig(
          MultiPlayerSetupRoute.name,
          path: '/multi-player-setup-page',
        ),
        RouteConfig(
          JoinGameRoute.name,
          path: '/join-game-page',
        ),
        RouteConfig(
          CreateGameRoute.name,
          path: '/create-game-page',
        ),
        RouteConfig(
          LobbyRoute.name,
          path: '/lobby-page',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [DifficultyOptionsPage]
class DifficultyOptionsRoute extends PageRouteInfo<void> {
  const DifficultyOptionsRoute()
      : super(
          DifficultyOptionsRoute.name,
          path: '/difficulty-options-page',
        );

  static const String name = 'DifficultyOptionsRoute';
}

/// generated route for
/// [NumberQuestionsPage]
class NumberQuestionsRoute extends PageRouteInfo<NumberQuestionsRouteArgs> {
  NumberQuestionsRoute({
    Key? key,
    required Mode mode,
  }) : super(
          NumberQuestionsRoute.name,
          path: '/number-questions-page',
          args: NumberQuestionsRouteArgs(
            key: key,
            mode: mode,
          ),
        );

  static const String name = 'NumberQuestionsRoute';
}

class NumberQuestionsRouteArgs {
  const NumberQuestionsRouteArgs({
    this.key,
    required this.mode,
  });

  final Key? key;

  final Mode mode;

  @override
  String toString() {
    return 'NumberQuestionsRouteArgs{key: $key, mode: $mode}';
  }
}

/// generated route for
/// [ConfirmSettingsPage]
class ConfirmSettingsRoute extends PageRouteInfo<ConfirmSettingsRouteArgs> {
  ConfirmSettingsRoute({
    Key? key,
    required Mode mode,
    required int numberQuestions,
  }) : super(
          ConfirmSettingsRoute.name,
          path: '/confirm-settings-page',
          args: ConfirmSettingsRouteArgs(
            key: key,
            mode: mode,
            numberQuestions: numberQuestions,
          ),
        );

  static const String name = 'ConfirmSettingsRoute';
}

class ConfirmSettingsRouteArgs {
  const ConfirmSettingsRouteArgs({
    this.key,
    required this.mode,
    required this.numberQuestions,
  });

  final Key? key;

  final Mode mode;

  final int numberQuestions;

  @override
  String toString() {
    return 'ConfirmSettingsRouteArgs{key: $key, mode: $mode, numberQuestions: $numberQuestions}';
  }
}

/// generated route for
/// [QuizPage]
class QuizRoute extends PageRouteInfo<void> {
  const QuizRoute()
      : super(
          QuizRoute.name,
          path: '/quiz-page',
        );

  static const String name = 'QuizRoute';
}

/// generated route for
/// [EndGamePage]
class EndGameRoute extends PageRouteInfo<void> {
  const EndGameRoute()
      : super(
          EndGameRoute.name,
          path: '/end-game-page',
        );

  static const String name = 'EndGameRoute';
}

/// generated route for
/// [SpeedSetupPage]
class SpeedSetupRoute extends PageRouteInfo<void> {
  const SpeedSetupRoute()
      : super(
          SpeedSetupRoute.name,
          path: '/speed-setup-page',
        );

  static const String name = 'SpeedSetupRoute';
}

/// generated route for
/// [MultiPlayerSetupPage]
class MultiPlayerSetupRoute extends PageRouteInfo<void> {
  const MultiPlayerSetupRoute()
      : super(
          MultiPlayerSetupRoute.name,
          path: '/multi-player-setup-page',
        );

  static const String name = 'MultiPlayerSetupRoute';
}

/// generated route for
/// [JoinGamePage]
class JoinGameRoute extends PageRouteInfo<JoinGameRouteArgs> {
  JoinGameRoute({
    Key? key,
    required String name,
  }) : super(
          JoinGameRoute.name,
          path: '/join-game-page',
          args: JoinGameRouteArgs(
            key: key,
            name: name,
          ),
        );

  static const String name = 'JoinGameRoute';
}

class JoinGameRouteArgs {
  const JoinGameRouteArgs({
    this.key,
    required this.name,
  });

  final Key? key;

  final String name;

  @override
  String toString() {
    return 'JoinGameRouteArgs{key: $key, name: $name}';
  }
}

/// generated route for
/// [CreateGamePage]
class CreateGameRoute extends PageRouteInfo<CreateGameRouteArgs> {
  CreateGameRoute({
    Key? key,
    required String name,
  }) : super(
          CreateGameRoute.name,
          path: '/create-game-page',
          args: CreateGameRouteArgs(
            key: key,
            name: name,
          ),
        );

  static const String name = 'CreateGameRoute';
}

class CreateGameRouteArgs {
  const CreateGameRouteArgs({
    this.key,
    required this.name,
  });

  final Key? key;

  final String name;

  @override
  String toString() {
    return 'CreateGameRouteArgs{key: $key, name: $name}';
  }
}

/// generated route for
/// [LobbyPage]
class LobbyRoute extends PageRouteInfo<void> {
  const LobbyRoute()
      : super(
          LobbyRoute.name,
          path: '/lobby-page',
        );

  static const String name = 'LobbyRoute';
}
