//@dart=2.9

import 'package:app_patine/app/view/lista_exercicios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Lista Exercicios', (WidgetTester tester) async {
    await tester.pumpWidget(ListaExercicios());
    expect(find.byType(Container), findsOneWidget);
  });
}
