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
import 'package:four_gospels/services/quiz_service.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    logEvent();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<QuizService>(
          create: (context) => QuizService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              final quizService = RepositoryProvider.of<QuizService>(context);

              return QuizBloc(quizService);
            },
          ),
        ],
        child: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          theme: ThemeData(
            primaryColor: const Color(0xff144C6E), //primary default
            primaryColorDark: const Color(0xff0F3953), //primary dark
            primaryColorLight: const Color(0xff89A6B7), //primary light
            scaffoldBackgroundColor: const Color(0xffE0E0DF), //bg
            iconTheme:
                const IconThemeData(color: Color(0xffFFFFFF)), //white icon
            primaryIconTheme:
                const IconThemeData(color: Color(0xff030303)), //black icon
            cardColor: const Color(0xffFFFFFF), //primary lightest
            dividerColor: const Color(0xff0A2637), //primary darker
            disabledColor: const Color(0xff979797), //gray default

            colorScheme: const ColorScheme(
              primary: Color(0xff2A7221), //success default
              primaryContainer: Color(0xff205519), //success dark
              secondary: Color(0xff266B6B), //accent1 dark
              secondaryContainer: Color(0xff99C7C7), //accent1 light
              tertiary: Color(0xff2B78B2), //accent2 dark
              tertiaryContainer: Color(0xff9CCFF6), //accent2 light
              error: Color(0xffD00000), //error default

              onPrimary: Colors.white,
              onSecondary: Color(0xff413D3D),
              brightness: Brightness.light,
              onError: Color(0xffC8C8C8),
              background: Color(0xffE0E0DF),
              onBackground: Color(0xff616161),
              surface: Colors.white,
              onSurface: Color(0xff616161),
            ),
            appBarTheme: AppBarTheme(
              color: const Color(0xff144C6E), //primary default
              titleTextStyle: GoogleFonts.getFont('KoHo').merge(
                const TextStyle(
                  fontSize: 34,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w900,
                  letterSpacing: 4,
                ),
              ),
            ),
            textTheme: GoogleFonts.getTextTheme(
              'KoHo',
              const TextTheme(
                //subtitle
                titleMedium: TextStyle(
                  fontSize: 22,
                  color: Color(0xff585858),
                  fontWeight: FontWeight.bold,
                ),
                //question subtitle
                titleSmall: TextStyle(
                  fontSize: 22,
                  color: Color(0xff2E2E2E),
                ),
                //start button
                displayLarge: TextStyle(
                  fontSize: 64,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w600,
                ),
                //num questions labels
                displayMedium: TextStyle(
                  fontSize: 58,
                  color: Color(0xff144C6E),
                  fontWeight: FontWeight.w700,
                ),
                //option labels, submit
                headlineMedium: TextStyle(
                  fontSize: 32,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w600,
                ),
                //question
                headlineSmall: TextStyle(
                  fontSize: 24,
                  color: Color(0xff030303),
                  fontWeight: FontWeight.bold,
                ),
                //answers
                bodyLarge: TextStyle(
                  fontSize: 20,
                  color: Color(0xff030303),
                  fontWeight: FontWeight.w500,
                ),

                //
                displaySmall: TextStyle(
                  fontSize: 45,
                ),
                titleLarge: TextStyle(
                  fontSize: 20,
                ),
                labelSmall: TextStyle(
                  fontSize: 10,
                ),
                bodyMedium: TextStyle(
                  fontSize: 14,
                ),
                labelLarge: TextStyle(
                  fontSize: 14,
                ),
                bodySmall: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }

  Future<void> logEvent() async {
    final analytics = FirebaseAnalytics.instance;
    await analytics.logEvent(name: 'opened_app');
  }
}
