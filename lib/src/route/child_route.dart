import 'package:flutter/cupertino.dart';
import 'package:meteor/meteor.dart';
import 'package:modular_core/modular_core.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

class ChildRoute<T> extends MeteorRoute<T> {
  ChildRoute(
    String name, {
    required MeteorChild child,
    super.title,
    super.guards,
    super.customTransition,
    super.children,
    super.duration,
    super.transition,
    super.maintainState,
  }) : super(name: name, child: child);
}

class RedirectRoute extends ChildRoute implements modular.RedirectRoute {
  @override
  final String to;

  RedirectRoute(super.name, {required this.to}) : super(child: (_, __) => const SizedBox());

  @override
  RedirectRoute copyWith({
    MeteorChild? child,
    RouteContext? context,
    TransitionType? transition,
    CustomTransition? customTransition,
    Duration? duration,
    String? name,
    String? schema,
    void Function(dynamic)? popCallback,
    List<Middleware>? middlewares,
    List<MeteorRoute>? children,
    String? parent,
    Uri? uri,
    Map<ModularKey, ModularRoute>? routeMap,
    Map<Type, BindContext>? bindContextEntries,
  }) {
    return this;
  }
}

class WildcardRoute<T> extends ChildRoute<T> {
  WildcardRoute({
    required MeteorChild child,
    TransitionType transition = TransitionType.defaultTransition,
    CustomTransition? customTransition,
    Duration duration = const Duration(milliseconds: 300),
  }) : super('/**', duration: duration, child: child, customTransition: customTransition, transition: transition);
}


