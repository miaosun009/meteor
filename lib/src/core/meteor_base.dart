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
}

extension ModularArgumentsExt on ModularArguments {
  MeteorRouteArguments toMeteorRouteArguments() {
    return MeteorRouteArguments();
  }
}

class MeteorRouteArguments implements ModularArguments {
  MeteorRouteArguments();

  @override
  ModularArguments copyWith({Map<String, dynamic>? params, data, Uri? uri}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  // TODO: implement data
  get data => throw UnimplementedError();

  @override
  // TODO: implement fragment
  String get fragment => throw UnimplementedError();

  @override
  // TODO: implement params
  Map<String, dynamic> get params => throw UnimplementedError();

  @override
  // TODO: implement queryParams
  Map<String, String> get queryParams => throw UnimplementedError();

  @override
  // TODO: implement queryParamsAll
  Map<String, List<String>> get queryParamsAll => throw UnimplementedError();

  @override
  // TODO: implement uri
  Uri get uri => throw UnimplementedError();
}
