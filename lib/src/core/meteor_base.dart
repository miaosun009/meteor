import 'package:flutter/cupertino.dart';
import 'package:modular_core/modular_core.dart';
import '../route/router_delegate.dart';
import 'meteor_navigator.dart';
import '../modular_export.dart';

abstract class MeteorBase {
  MeteorNavigator get to;

  RouterDelegate<Object> get routerDelegate;

  RouteInformationParser<Object> get routeInformationParser;
}

class MeteorBaseImpl implements MeteorBase {
  MeteorBaseImpl();

  @override
  final MeteorNavigator to = MeteorNavigatorImpl();

  @override
  RouterDelegate<Object> get routerDelegate => Modular.routerDelegate;

  @override
  RouteInformationParser<Object> get routeInformationParser => Modular.routeInformationParser;
}
