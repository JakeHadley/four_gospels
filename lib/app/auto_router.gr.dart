// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    EndGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EndGamePage(),
      );
    },
    QuizRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuizPage(),
      );
    },
    SpeedSetupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SpeedSetupPage(),
      );
    },
    JoinGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JoinGamePage(),
      );
    },
    MultiPlayerSetupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MultiPlayerSetupPage(),
      );
    },
    CreateGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateGamePage(),
      );
    },
    LobbyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LobbyPage(),
      );
    },
    ConfirmSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmSettingsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConfirmSettingsPage(
          mode: args.mode,
          numberQuestions: args.numberQuestions,
          key: args.key,
        ),
      );
    },
    NumberQuestionsRoute.name: (routeData) {
      final args = routeData.argsAs<NumberQuestionsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NumberQuestionsPage(
          mode: args.mode,
          key: args.key,
        ),
      );
    },
    DifficultyOptionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DifficultyOptionsPage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EndGamePage]
class EndGameRoute extends PageRouteInfo<void> {
  const EndGameRoute({List<PageRouteInfo>? children})
      : super(
          EndGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'EndGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuizPage]
class QuizRoute extends PageRouteInfo<void> {
  const QuizRoute({List<PageRouteInfo>? children})
      : super(
          QuizRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SpeedSetupPage]
class SpeedSetupRoute extends PageRouteInfo<void> {
  const SpeedSetupRoute({List<PageRouteInfo>? children})
      : super(
          SpeedSetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpeedSetupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JoinGamePage]
class JoinGameRoute extends PageRouteInfo<void> {
  const JoinGameRoute({List<PageRouteInfo>? children})
      : super(
          JoinGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MultiPlayerSetupPage]
class MultiPlayerSetupRoute extends PageRouteInfo<void> {
  const MultiPlayerSetupRoute({List<PageRouteInfo>? children})
      : super(
          MultiPlayerSetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'MultiPlayerSetupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateGamePage]
class CreateGameRoute extends PageRouteInfo<void> {
  const CreateGameRoute({List<PageRouteInfo>? children})
      : super(
          CreateGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LobbyPage]
class LobbyRoute extends PageRouteInfo<void> {
  const LobbyRoute({List<PageRouteInfo>? children})
      : super(
          LobbyRoute.name,
          initialChildren: children,
        );

  static const String name = 'LobbyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfirmSettingsPage]
class ConfirmSettingsRoute extends PageRouteInfo<ConfirmSettingsRouteArgs> {
  ConfirmSettingsRoute({
    required Mode mode,
    required int numberQuestions,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ConfirmSettingsRoute.name,
          args: ConfirmSettingsRouteArgs(
            mode: mode,
            numberQuestions: numberQuestions,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmSettingsRoute';

  static const PageInfo<ConfirmSettingsRouteArgs> page =
      PageInfo<ConfirmSettingsRouteArgs>(name);
}

class ConfirmSettingsRouteArgs {
  const ConfirmSettingsRouteArgs({
    required this.mode,
    required this.numberQuestions,
    this.key,
  });

  final Mode mode;

  final int numberQuestions;

  final Key? key;

  @override
  String toString() {
    return 'ConfirmSettingsRouteArgs{mode: $mode, numberQuestions: $numberQuestions, key: $key}';
  }
}

/// generated route for
/// [NumberQuestionsPage]
class NumberQuestionsRoute extends PageRouteInfo<NumberQuestionsRouteArgs> {
  NumberQuestionsRoute({
    required Mode mode,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          NumberQuestionsRoute.name,
          args: NumberQuestionsRouteArgs(
            mode: mode,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NumberQuestionsRoute';

  static const PageInfo<NumberQuestionsRouteArgs> page =
      PageInfo<NumberQuestionsRouteArgs>(name);
}

class NumberQuestionsRouteArgs {
  const NumberQuestionsRouteArgs({
    required this.mode,
    this.key,
  });

  final Mode mode;

  final Key? key;

  @override
  String toString() {
    return 'NumberQuestionsRouteArgs{mode: $mode, key: $key}';
  }
}

/// generated route for
/// [DifficultyOptionsPage]
class DifficultyOptionsRoute extends PageRouteInfo<void> {
  const DifficultyOptionsRoute({List<PageRouteInfo>? children})
      : super(
          DifficultyOptionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DifficultyOptionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
