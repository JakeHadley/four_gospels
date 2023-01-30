import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:four_gospels/single_player_setup/widgets/start_button.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Start Button', () {
    testWidgets('Start Button', (tester) async {
      await tester.pumpApp(
        StartButton(
          onPress: (_) {},
          isInitialState: false,
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });
    testWidgets('Start Button Loading', (tester) async {
      await tester.pumpApp(
        StartButton(
          onPress: (_) {},
          isInitialState: true,
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(Text), findsOneWidget);
    });
  });
}
