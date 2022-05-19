import 'package:flutter/cupertino.dart';
import 'package:meteor/src/route/p.dart';
import '../modular_export.dart';
import 'book.dart';

class MeteorRouterDelegate extends RouterDelegate<Object> {
  @override
  void addListener(VoidCallback listener) => Modular.routerDelegate.removeListener(listener);

  @override
  Widget build(BuildContext context) => Modular.routerDelegate.build(context);

  @override
  Future<bool> popRoute() => Modular.routerDelegate.popRoute();

  @override
  void removeListener(VoidCallback listener) => Modular.routerDelegate.removeListener(listener);

  @override
  Future<void> setNewRoutePath(dynamic configuration) => Modular.routerDelegate.setNewRoutePath(configuration);
}
