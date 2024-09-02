import 'package:drawing_application/features/app/drawing_app.dart';
import 'package:drawing_application/features/get_it/get_it.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  beforeRun();
  runApp(DrawingApp());
}

void beforeRun() {
  configureDependencies();
  setupLogger();
}
