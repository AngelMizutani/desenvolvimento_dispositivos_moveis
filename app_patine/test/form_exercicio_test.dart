//@dart=2.9

import 'package:app_patine/app/injection.dart';
import 'package:app_patine/app/view/form_exercicio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Form Exercicio', (WidgetTester tester) async {
    await setupInjection();
    await tester.pumpWidget(FormExercicio());
    expect(find.text('Cadastrar exercício'), findsNothing);
  });
}
