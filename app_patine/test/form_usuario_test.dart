//@dart=2.9

import 'package:app_patine/app/injection.dart';
import 'package:app_patine/app/view/form_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Form Usuario', (WidgetTester tester) async {
    await setupInjection();
    await tester.pumpWidget(FormUsuario());
    expect(find.byType(TextFormField), findsNothing);
  });
}
