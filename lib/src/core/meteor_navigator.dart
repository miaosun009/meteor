import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meteor/meteor.dart';

abstract class MeteorNavigator extends IModularNavigator {
  MeteorRoute get root;

  MeteorRoute get current;

  @override
  List<MeteorRoute> get navigateHistory;

  @override
  Future<void> navigate(String path, {dynamic arguments});

  Future<void> popRoot();
}

class MeteorNavigatorImpl implements MeteorNavigator {
  @override
  List<MeteorRoute> get navigateHistory => Modular.to.navigateHistory.cast<MeteorRoute>();

  @override
  MeteorRoute get root => navigateHistory.first;

  @override
  MeteorRoute get current => navigateHistory.last;

  @override
  Future<void> navigate(String path, {dynamic arguments}) {
    Modular.to.navigate(path, arguments: arguments);
    return Future.delayed(const Duration(milliseconds: 0), () {});
  }

  @override
  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments, bool forRoot = false}) {
    return Modular.to.pushNamed<T>(routeName, arguments: arguments, forRoot: forRoot);
  }

  @override
  void addListener(VoidCallback listener) => Modular.to.addListener(listener);

  @override
  bool canPop() => Modular.to.canPop();

  @override
  Future<bool> maybePop<T extends Object?>([T? result]) => Modular.to.maybePop(result);

  @override
  String get path => Modular.to.path;

  @override
  void pop<T extends Object?>([T? result]) => Modular.to.pop(result);

  @override
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(String routeName, {TO? result, Object? arguments, bool forRoot = false}) {
    return Modular.to.popAndPushNamed(routeName, result: result, arguments: arguments, forRoot: forRoot);
  }

  @override
  void popUntil(bool Function(Route p1) predicate) => Modular.to.popUntil(predicate);

  @override
  Future<T?> push<T extends Object?>(Route<T> route) => Modular.to.push(route);

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(String newRouteName, bool Function(Route p1) predicate, {Object? arguments, bool forRoot = false}) {
    return Modular.to.pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments, forRoot: forRoot);
  }

  @override
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(String routeName, {TO? result, Object? arguments, bool forRoot = false}) {
    return Modular.to.pushReplacementNamed(routeName, result: result, arguments: arguments, forRoot: forRoot);
  }

  @override
  void removeListener(VoidCallback listener) => Modular.to.removeListener(listener);

  @override
  void setNavigatorKey(GlobalKey<NavigatorState>? navigatorKey) => Modular.to.setNavigatorKey(navigatorKey);

  @override
  void setObservers(List<NavigatorObserver> navigatorObservers) => Modular.to.setObservers(navigatorObservers);

  @override
  Future<void> popRoot() => navigate(root.name);
}
