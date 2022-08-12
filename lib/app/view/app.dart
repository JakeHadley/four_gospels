// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:four_gospels/app/auto_router.dart';
import 'package:four_gospels/l10n/l10n.dart';
import 'package:four_gospels/quiz/quiz.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    logEvent();
    return BlocProvider(
      create: (BuildContext context) => QuizBloc(),
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(
          colorScheme: const ColorScheme(
            primary: Color(0xff130cb7),
            onPrimary: Colors.white,
            secondary: Color(0xff56b2de),
            onSecondary: Color(0xff413D3D),
            brightness: Brightness.light,
            onError: Color(0xffC8C8C8),
            error: Color(0xffAA0000),
            background: Colors.white,
            onBackground: Color(0xff616161),
            surface: Colors.white,
            onSurface: Color(0xff616161),
          ),
          textTheme: GoogleFonts.nunitoTextTheme().merge(
            const TextTheme(),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  Future<void> logEvent() async {
    final analytics = FirebaseAnalytics.instance;
    await analytics.logEvent(name: 'opened_app');
  }
}
