//@dart=2.9
import 'package:app_patine/app/view/login_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Tela de Login', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginUsuario(),
    ));

    expect(find.text('Bem-vindo ao Patine!'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsWidgets);
  });
}
