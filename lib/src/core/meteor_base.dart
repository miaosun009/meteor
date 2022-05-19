import 'package:flutter/cupertino.dart';
import 'package:modular_core/modular_core.dart';
import 'meteor_navigator.dart';
import '../modular_export.dart';

abstract class MeteorBase {
  MeteorNavigator get to;

  RouterDelegate<Object> get routerDelegate;

  RouteInformationParser<Object> get routeInformationParser;

  String get initialRoute;

  MeteorRouteArguments get arguments;

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
  MeteorRouteArguments get arguments => Modular.args.toMeteorRouteArguments();

  @override
  setArguments(dynamic data) => Modular.setArguments(data);

  @override
  B get<B extends Object>({B? defaultValue}) => Modular.get<B>();

  @override
  Future<B> getAsync<B extends Object>({B? defaultValue}) => Modular.getAsync<B>();
}

extension ModularArgumentsExt on ModularArguments {
  MeteorRouteArguments toMeteorRouteArguments() {
    return MeteorRouteArguments(uri: uri, params: params, data: data);
  }
}

class MeteorRouteArguments extends ModularArguments {
  MeteorRouteArguments({required super.uri, super.params, super.data});

  @override
  MeteorRouteArguments copyWith({Map<String, dynamic>? params, dynamic data, Uri? uri}) {
    return MeteorRouteArguments(
      params: params ?? this.params,
      data: data ?? this.data,
      uri: uri ?? this.uri,
    );
  }
}
