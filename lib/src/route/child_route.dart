import 'package:flutter/cupertino.dart';
import 'package:meteor/meteor.dart';
import 'package:meteor/src/core/meteor_base.dart';
import 'package:modular_core/modular_core.dart';
import 'package:flutter_modular/flutter_modular.dart' as m;
import 'meteor_route.dart';

class ChildRoute<T> extends MeteorRoute<T> {
  ChildRoute(
    String name, {
    required MeteorChild child,
    super.title,
    super.middlewares,
    super.customTransition,
    super.children,
    super.duration,
    super.transition,
    super.maintainState,
  }) : super(name: name, child: child);
}

class RedirectRoute extends m.RedirectRoute {
  RedirectRoute(super.name, {required super.to});
}

class WildcardRoute extends m.WildcardRoute {
  WildcardRoute({required MeteorChild child})
      : super(
          child: (context, args) => child.call(
            context,
            args.toMeteorRouteArguments(),
          ),
        );
}
