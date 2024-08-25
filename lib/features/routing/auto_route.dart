import 'package:auto_route/auto_route.dart';
import 'package:drawing_application/features/routing/auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        ..._drawingRoutes,
      ];

  List<AutoRoute> get _drawingRoutes => [
        AdaptiveRoute(
          page: DrawingRouteRootRoute.page,
          initial: true,
          children: <AutoRoute>[
            AdaptiveRoute(
              page: DrawingRoute.page,
              initial: true,
            ),
          ],
        ),
      ];
}
