import 'package:flutter/cupertino.dart';
import 'package:meteor/meteor.dart';
import 'package:meteor/src/core/meteor_base.dart';
import 'package:modular_core/modular_core.dart';

typedef MeteorChild = Widget Function(BuildContext context, MeteorRouteArguments args);

class MeteorRoute<T> extends ParallelRoute<T> {
  final String title;

  MeteorRoute({
    required super.name,
    MeteorChild? child,
    this.title = '',
    super.popCallback,
    super.maintainState,
    super.parent,
    super.schema,
    super.transition,
    super.customTransition,
    super.duration,
    super.children,
    List<Middleware> guards = const [],
    super.context,
    super.uri,
    super.routeMap,
    super.bindContextEntries,
  }) : super(
          child: child != null
              ? (context, args) => child.call(
                    context,
                    args.toMeteorRouteArguments(),
                  )
              : null,
          middlewares: guards.cast<Middleware>().toList(growable: true),
        );

  @override
  MeteorRoute<T> copyWith({
    covariant MeteorChild? child,
    RouteContext? context,
    TransitionType? transition,
    CustomTransition? customTransition,
    Duration? duration,
    String? name,
    String? schema,
    void Function(dynamic)? popCallback,
    covariant List<Middleware>? middlewares,
    covariant List<MeteorRoute>? children,
    String? parent,
    Uri? uri,
    Map<ModularKey, ModularRoute>? routeMap,
    Map<Type, BindContext>? bindContextEntries,
  }) {
    return MeteorRoute<T>(
      child: child ?? this.child as dynamic,
      name: name ?? this.name,
      context: context ?? this.context,
      schema: schema ?? this.schema,
      parent: parent ?? this.parent,
      transition: transition ?? this.transition,
      customTransition: customTransition ?? this.customTransition,
      duration: duration ?? this.duration,
      popCallback: popCallback,
      guards: middlewares ?? this.middlewares,
      children: children ?? this.children,
      uri: uri ?? this.uri,
      routeMap: routeMap,
      bindContextEntries: bindContextEntries ?? this.bindContextEntries,
      title: title,
    );
  }
}

class ModuleRoute<T> extends MeteorRoute<T> {
  ModuleRoute._start({
    required super.name,
    super.child,
    super.popCallback,
    super.transition,
    super.customTransition,
    super.duration,
    super.parent,
    super.schema,
    super.children,
    super.guards,
    super.context,
    super.uri,
    super.bindContextEntries,
  });

  factory ModuleRoute(
    String name, {
    required Module module,
    TransitionType? transition,
    CustomTransition? customTransition,
    Duration? duration,
    List<RouteGuard> guards = const [],
  }) {
    final route = ModuleRoute._start(name: name, guards: guards, transition: transition, customTransition: customTransition, duration: duration);
    return route.addModule(name, module: module) as dynamic;
  }

  @override
  ModuleRoute<T> copyWith({
    covariant MeteorChild? child,
    RouteContext? context,
    TransitionType? transition,
    CustomTransition? customTransition,
    Duration? duration,
    String? name,
    String? schema,
    void Function(dynamic)? popCallback,
    covariant List<MeteorMiddleware>? middlewares,
    covariant List<MeteorRoute>? children,
    String? parent,
    Uri? uri,
    Map<ModularKey, ModularRoute>? routeMap,
    Map<Type, BindContext>? bindContextEntries,
  }) {
    return ModuleRoute<T>._start(
      child: child ?? this.child,
      transition: transition ?? this.transition,
      customTransition: customTransition ?? this.customTransition,
      duration: duration ?? this.duration,
      name: name ?? this.name,
      schema: schema ?? this.schema,
      popCallback: popCallback ?? popCallback,
      guards: middlewares ?? this.middlewares.cast<MeteorMiddleware>().toList(),
      children: children ?? this.children,
      parent: parent ?? this.parent,
      uri: uri ?? this.uri,
      context: context ?? this.context,
      bindContextEntries: bindContextEntries ?? this.bindContextEntries,
    );
  }
}
