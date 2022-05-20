import 'package:flutter_modular/flutter_modular.dart' as modular;

import 'package:meteor/meteor.dart';

abstract class MeteorModule extends modular.Module {
  @override
  MeteorRoute copy(covariant MeteorRoute parent, covariant MeteorRoute route) {
    final newRoute = _copy(parent, route);
    return newRoute.copyWith(
      customTransition: route.customTransition ?? parent.customTransition,
      transition: route.transition ?? parent.transition,
      duration: route.duration ?? parent.duration,
    );
  }

  MeteorRoute _copy(MeteorRoute parent, MeteorRoute route) {
    final newName = '${parent.name}${route.name}'.replaceFirst('//', '/');
    return route.copyWith(
      name: newName,
      middlewares: [
        ...parent.middlewares.cast<MeteorMiddleware>().toList(),
        ...route.middlewares.cast<MeteorMiddleware>().toList(),
      ],
      bindContextEntries: {
        ...parent.bindContextEntries,
        ...route.bindContextEntries,
      },
    );
  }
}

abstract class Module extends MeteorModule {}
