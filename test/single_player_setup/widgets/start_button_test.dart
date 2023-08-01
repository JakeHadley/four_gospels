import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:four_gospels/single_player_setup/widgets/start_button.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Start Button', () {
    testWidgets('Start Button', (tester) async {
      await tester.pumpApp(
        StartButton(
          isLoading: true,
          onPress: () {},
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });
    // testWidgets('Start Button Loading', (tester) async {
    //   await tester.pumpApp(
    //     StartButton(
    //       onPress: (_) {},
    //       isInitialState: true,
    //     ),
    //   );
    //   expect(find.byType(CircularProgressIndicator), findsNothing);
    //   expect(find.byType(Text), findsOneWidget);
    // });
    // testWidgets('Start Button onPress', (tester) async {
    //   var pressed = false;
    //   await tester.pumpApp(
    //     StartButton(
    //       onPress: (_) {
    //         pressed = true;
    //       },
    //       isInitialState: true,
    //     ),
    //   );
    //   await tester.tap(find.text('Start'));
    //   expect(pressed, isTrue);
    // });
  });
}
