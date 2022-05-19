import 'dart:async';

import 'package:meteor/meteor.dart';
import 'package:modular_core/modular_core.dart';

abstract class RouteGuard extends Middleware<Object> {
  FutureOr<bool> check(String path, MeteorRoute route);

  final String? redirectTo;

  RouteGuard({this.redirectTo});

  @override
  FutureOr<ModularRoute?> pre(ModularRoute route) => route;

  @override
  FutureOr<ParallelRoute?> pos(route, covariant Object data) async {
    var args = data as ModularArguments;
    if (await check(args.uri.toString(), route as MeteorRoute)) {
      return route;
    } else if (redirectTo != null) {
      return RedirectRoute(route.name, to: redirectTo!);
    }

    throw Exception(route.uri.toString().trim());
  }
}
