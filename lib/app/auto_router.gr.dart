// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

/// generated route for
/// [EndGamePage]
class EndGameRoute extends PageRouteInfo<EndGameRouteArgs> {
  EndGameRoute({
    required QuizType quizType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EndGameRoute.name,
          args: EndGameRouteArgs(
            quizType: quizType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EndGameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EndGameRouteArgs>();
      return EndGamePage(
        quizType: args.quizType,
        key: args.key,
      );
    },
  );
}

class EndGameRouteArgs {
  const EndGameRouteArgs({
    required this.quizType,
    this.key,
  });

  final QuizType quizType;

  final Key? key;

  @override
  String toString() {
    return 'EndGameRouteArgs{quizType: $quizType, key: $key}';
  }
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LobbyPage();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MultiPlayerSetupPage();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QuizPage();
    },
  );
}

/// generated route for
/// [SinglePlayerSetupPage]
class SinglePlayerSetupRoute extends PageRouteInfo<void> {
  const SinglePlayerSetupRoute({List<PageRouteInfo>? children})
      : super(
          SinglePlayerSetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SinglePlayerSetupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SinglePlayerSetupPage();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SpeedSetupPage();
    },
  );
}
