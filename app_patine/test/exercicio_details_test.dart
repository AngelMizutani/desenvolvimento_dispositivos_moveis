//@dart=2.9

import 'package:app_patine/app/injection.dart';
import 'package:app_patine/app/view/exercicio_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Exercicio Details', (WidgetTester tester) async {
    //await setupInjection();
    await tester.pumpWidget(ExercicioDetails());
    expect(find.byType(LayoutBuilder), findsNothing);
  });
}
