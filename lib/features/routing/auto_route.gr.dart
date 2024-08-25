// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:drawing_application/features/drawing/presentation/screens/drawing_route_root_screen.dart'
    as _i1;
import 'package:drawing_application/features/drawing/presentation/screens/drawing_screen.dart'
    as _i2;

/// generated route for
/// [_i1.DrawingRouteRootScreen]
class DrawingRouteRootRoute extends _i3.PageRouteInfo<void> {
  const DrawingRouteRootRoute({List<_i3.PageRouteInfo>? children})
      : super(
          DrawingRouteRootRoute.name,
          initialChildren: children,
        );

  static const String name = 'DrawingRouteRootRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.DrawingRouteRootScreen();
    },
  );
}

/// generated route for
/// [_i2.DrawingScreen]
class DrawingRoute extends _i3.PageRouteInfo<void> {
  const DrawingRoute({List<_i3.PageRouteInfo>? children})
      : super(
          DrawingRoute.name,
          initialChildren: children,
        );

  static const String name = 'DrawingRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.DrawingScreen();
    },
  );
}
