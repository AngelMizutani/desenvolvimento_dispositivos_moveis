//@dart=2.9
import 'package:app_patine/app/injection.dart';
import 'package:flutter/material.dart';
import 'app/my_app.dart';

void main() async {
  await setupInjection();
  runApp(MyApp());
}
