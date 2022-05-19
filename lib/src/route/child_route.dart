import 'package:meteor/meteor.dart';

import 'meteor_route.dart';

class ChildRoute<T> extends MeteorRoute<T> {
  ChildRoute(
    String name, {
    required super.child,
    super.title,
    super.middlewares,
    super.customTransition,
    super.children = const [],
    super.duration,
    super.transition,
    super.maintainState,
  }) : super(name: name);
}
