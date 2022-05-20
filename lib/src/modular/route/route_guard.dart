import 'dart:async';

import 'package:meteor/meteor.dart';
import 'package:modular_core/modular_core.dart';

abstract class MeteorMiddleware<T> extends Middleware<T> {
  @override
  FutureOr<MeteorRoute?> pre(covariant MeteorRoute route);

  @override
  FutureOr<MeteorRoute?> pos(covariant MeteorRoute route, covariant T data);
}

abstract class RouteGuard extends MeteorMiddleware<Object> {
  FutureOr<bool> check(String path, MeteorRoute route);

  final String? redirectTo;

  RouteGuard({this.redirectTo});

  @override
  FutureOr<MeteorRoute?> pre(MeteorRoute route) => route;

  @override
  FutureOr<MeteorRoute?> pos(route, covariant Object data) async {
    var args = data as ModularArguments;
    if (await check(args.uri.toString(), route)) {
      return route;
    } else if (redirectTo != null) {
      return RedirectRoute(route.name, to: redirectTo!);
    }

    throw GuardedRouteException(route.uri.toString().trim());
  }
}
