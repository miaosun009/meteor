import 'package:flutter/cupertino.dart';
import 'package:meteor/meteor.dart';
import 'package:meteor/src/modular/route/route_arguments.dart';

abstract class MeteorBase {
  MeteorNavigator get to;

  RouterDelegate<Object> get routerDelegate;

  RouteInformationParser<Object> get routeInformationParser;

  String get initialRoute;

  RouteArguments get arguments;

  void setInitialRoute(String initialRoute);

  void setObservers(List<NavigatorObserver> navigatorObservers);

  void setNavigatorKey(GlobalKey<NavigatorState>? navigatorKey);

  void setArguments(dynamic data);

  B get<B extends Object>({B? defaultValue});

  Future<B> getAsync<B extends Object>({B? defaultValue});
}

class MeteorBaseImpl implements MeteorBase {
  MeteorBaseImpl(this.to);

  @override
  final MeteorNavigator to;

  @override
  RouterDelegate<Object> get routerDelegate => Modular.routerDelegate;

  @override
  RouteInformationParser<Object> get routeInformationParser => Modular.routeInformationParser;

  @override
  String get initialRoute => Modular.initialRoute;

  @override
  void setInitialRoute(String initialRoute) => Modular.setInitialRoute(initialRoute);

  @override
  void setNavigatorKey(GlobalKey<NavigatorState>? navigatorKey) => to.setNavigatorKey(navigatorKey);

  @override
  void setObservers(List<NavigatorObserver> navigatorObservers) => to.setObservers(navigatorObservers);

  @override
  RouteArguments get arguments => Modular.args.toRouteArguments();

  @override
  setArguments(dynamic data) => Modular.setArguments(data);

  @override
  B get<B extends Object>({B? defaultValue}) => Modular.get<B>();

  @override
  Future<B> getAsync<B extends Object>({B? defaultValue}) => Modular.getAsync<B>();
}
