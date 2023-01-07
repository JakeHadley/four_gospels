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
          routeData: routeData, child: const HomePage());
    },
    DifficultyOptionsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DifficultyOptionsPage());
    },
    NumberQuestionsRoute.name: (routeData) {
      final args = routeData.argsAs<NumberQuestionsRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: NumberQuestionsPage(key: args.key, mode: args.mode));
    },
    QuizRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const QuizPage());
    },
    EndGameRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EndGamePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(DifficultyOptionsRoute.name,
            path: '/difficulty-options-page'),
        RouteConfig(NumberQuestionsRoute.name, path: '/number-questions-page'),
        RouteConfig(QuizRoute.name, path: '/quiz-page'),
        RouteConfig(EndGameRoute.name, path: '/end-game-page')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [DifficultyOptionsPage]
class DifficultyOptionsRoute extends PageRouteInfo<void> {
  const DifficultyOptionsRoute()
      : super(DifficultyOptionsRoute.name, path: '/difficulty-options-page');

  static const String name = 'DifficultyOptionsRoute';
}

/// generated route for
/// [NumberQuestionsPage]
class NumberQuestionsRoute extends PageRouteInfo<NumberQuestionsRouteArgs> {
  NumberQuestionsRoute({Key? key, required Mode mode})
      : super(NumberQuestionsRoute.name,
            path: '/number-questions-page',
            args: NumberQuestionsRouteArgs(key: key, mode: mode));

  static const String name = 'NumberQuestionsRoute';
}

class NumberQuestionsRouteArgs {
  const NumberQuestionsRouteArgs({this.key, required this.mode});

  final Key? key;

  final Mode mode;

  @override
  String toString() {
    return 'NumberQuestionsRouteArgs{key: $key, mode: $mode}';
  }
}

/// generated route for
/// [QuizPage]
class QuizRoute extends PageRouteInfo<void> {
  const QuizRoute() : super(QuizRoute.name, path: '/quiz-page');

  static const String name = 'QuizRoute';
}

/// generated route for
/// [EndGamePage]
class EndGameRoute extends PageRouteInfo<void> {
  const EndGameRoute() : super(EndGameRoute.name, path: '/end-game-page');

  static const String name = 'EndGameRoute';
}
