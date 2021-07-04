//@dart=2.9

import 'package:app_patine/app/view/lista_treinadores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Titulo e nome', (WidgetTester tester) async {
    await tester.pumpWidget(ListaTreinadores());

    expect(find.byType(ListView), findsOneWidget);
  });
}
