import 'meteor_base.dart';
import 'former_export.dart';

export 'package:flutter_modular/flutter_modular.dart' hide ChildRoute, RedirectRoute, WildcardRoute, RouteGuard, ModuleRoute, Module;
export '../modular/route/meteor_route.dart';
export '../modular/route/route_guard.dart';
export '../modular/route/meteor_navigator.dart';
export '../modular/module.dart';
export '../modular/meteor_app.dart';
export '../modular/errors.dart';

MeteorBase? _meteor;
// ignore: non_constant_identifier_names
MeteorBase get Meteor {
  return _meteor ??= injector<MeteorBase>();
}

meteorClear() {
  _meteor = null;
}


