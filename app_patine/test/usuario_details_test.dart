//@dart=2.9

import 'package:app_patine/app/injection.dart';
import 'package:app_patine/app/view/usuario_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Usuario Details', (WidgetTester tester) async {
    await setupInjection();
    await tester.pumpWidget(UsuarioDetails());
    expect(find.byType(LayoutBuilder), findsNothing);
  });
}
