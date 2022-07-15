import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:four_gospels/home/home.dart';

part 'auto_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    // AutoRoute(page: SplashPage),
    // AutoRoute(
    //   page: HomeWrapperPage,
    //   children: [
    //     AutoRoute(page: HomePage, initial: true),
    //     AutoRoute(page: FormPage),
    //   ],
    // ),
  ],
)
class AppRouter extends _$AppRouter {}
