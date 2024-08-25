import 'package:drawing_application/features/routing/auto_route.dart';
import 'package:flutter/material.dart';

class DrawingApp extends StatelessWidget {
  DrawingApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: (_, Widget? child) {
        return child ?? const SizedBox();
      },
    );
  }
}
