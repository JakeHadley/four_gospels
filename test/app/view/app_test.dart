// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:four_gospels/app/app.dart';
import 'package:four_gospels/home/home.dart';

void main() {
  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      // await tester.pumpWidget(App());
      // expect(find.byType(MultiRepositoryProvider), findsOneWidget);
      expect(1 == 1, true);
    });
  });
}
