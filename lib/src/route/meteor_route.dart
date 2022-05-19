import 'package:meteor/meteor.dart';
import 'package:modular_core/modular_core.dart';

class MeteorRoute<T> extends ParallelRoute<T> {
  final String title;

  MeteorRoute({
    required super.name,
    required super.child,
    this.title = '',
    super.popCallback,
    super.maintainState,
    super.parent,
    super.schema,
    super.transition,
    super.customTransition,
    super.duration,
    super.children,
    super.middlewares,
    super.context,
    super.uri,
    super.routeMap,
    super.bindContextEntries,
  });

  @override
  MeteorRoute<T> copyWith({
    ModularChild? child,
    RouteContext? context,
    TransitionType? transition,
    CustomTransition? customTransition,
    Duration? duration,
    String? name,
    String? schema,
    void Function(dynamic)? popCallback,
    List<Middleware>? middlewares,
    List<ModularRoute>? children,
    String? parent,
    Uri? uri,
    Map<ModularKey, ModularRoute>? routeMap,
    Map<Type, BindContext>? bindContextEntries,
  }) {
    return MeteorRoute<T>(
      child: child ?? this.child,
      name: name ?? this.name,
      context: context ?? this.context,
      schema: schema ?? this.schema,
      parent: parent ?? this.parent,
      transition: transition ?? this.transition,
      customTransition: customTransition ?? this.customTransition,
      duration: duration ?? this.duration,
      popCallback: popCallback,
      middlewares: middlewares ?? this.middlewares,
      children: children ?? this.children,
      uri: uri ?? this.uri,
      routeMap: routeMap,
      bindContextEntries: bindContextEntries ?? this.bindContextEntries,
      title: title,
    );
  }
}
