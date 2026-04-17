import 'package:flutter_test/flutter_test.dart';

import 'package:personality_game/main.dart';

void main() {
  testWidgets('Welcome screen renders expected call to action', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PersonalityQuizApp());

    expect(find.text('Discover Your Type'), findsOneWidget);
    expect(find.text('Begin Quiz →'), findsOneWidget);
  });
}
