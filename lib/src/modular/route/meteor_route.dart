import 'package:flutter/cupertino.dart';
import 'package:meteor/meteor.dart';
import 'package:meteor/src/modular/route/route_arguments.dart';
import 'package:modular_core/modular_core.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

typedef MeteorChild = Widget Function(BuildContext context, RouteArguments args);

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
    List<MeteorMiddleware> middlewares = const [],
    super.context,
    super.uri,
    super.routeMap,
    super.bindContextEntries,
  }) : super(
            child: child != null
                ? (context, args) => child.call(
                      context,
                      args.toRouteArguments(),
                    )
                : null,
            middlewares: middlewares);


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
    covariant List<MeteorMiddleware>? middlewares,
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
      middlewares: (middlewares ?? this.middlewares).cast<MeteorMiddleware>().toList(),
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
    super.middlewares,
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
    List<MeteorMiddleware> guards = const [],
  }) {
    final route = ModuleRoute._start(name: name, middlewares: guards, transition: transition, customTransition: customTransition, duration: duration);
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
      child: child ?? this.child as dynamic,
      transition: transition ?? this.transition,
      customTransition: customTransition ?? this.customTransition,
      duration: duration ?? this.duration,
      name: name ?? this.name,
      schema: schema ?? this.schema,
      popCallback: popCallback ?? popCallback,
      middlewares: middlewares ?? this.middlewares as dynamic,
      children: children ?? this.children,
      parent: parent ?? this.parent,
      uri: uri ?? this.uri,
      context: context ?? this.context,
      bindContextEntries: bindContextEntries ?? this.bindContextEntries,
    );
  }
}

class ChildRoute<T> extends MeteorRoute<T> {
  ChildRoute(
      String name, {
        required MeteorChild child,
        super.title,
        List<MeteorMiddleware> guards = const [],
        super.customTransition,
        super.children,
        super.duration,
        super.transition,
        super.maintainState,
      }) : super(name: name, child: child, middlewares: guards);
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
    covariant List<MeteorMiddleware>? middlewares,
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

