//@dart=2.9

import 'package:app_patine/app/injection.dart';
import 'package:app_patine/app/view/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Tela Inicio', (WidgetTester tester) async {
    await setupInjection();
    await tester.pumpWidget(TelaInicial());
    expect(find.byType(ElevatedButton), findsWidgets);
  });
}
