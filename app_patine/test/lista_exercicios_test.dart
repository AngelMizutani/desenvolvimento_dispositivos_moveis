//@dart=2.9

import 'package:app_patine/app/injection.dart';
import 'package:app_patine/app/view/lista_exercicios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Lista de Exercicios', (WidgetTester tester) async {
    await setupInjection();
    await tester.pumpWidget(ListaExercicios());

    expect(find.byType(ListView), findsWidgets);
    expect(find.text('Exercícios de Patinação'), findsWidgets);
  });
}
