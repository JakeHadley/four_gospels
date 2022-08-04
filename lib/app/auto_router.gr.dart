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
    SinglePlayerSetupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SinglePlayerSetupPage());
    },
    QuizRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const QuizPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(SinglePlayerSetupRoute.name,
            path: '/single-player-setup-page'),
        RouteConfig(QuizRoute.name, path: '/quiz-page')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [SinglePlayerSetupPage]
class SinglePlayerSetupRoute extends PageRouteInfo<void> {
  const SinglePlayerSetupRoute()
      : super(SinglePlayerSetupRoute.name, path: '/single-player-setup-page');

  static const String name = 'SinglePlayerSetupRoute';
}

/// generated route for
/// [QuizPage]
class QuizRoute extends PageRouteInfo<void> {
  const QuizRoute() : super(QuizRoute.name, path: '/quiz-page');

  static const String name = 'QuizRoute';
}
