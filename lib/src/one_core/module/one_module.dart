import 'package:flutter/foundation.dart';
import 'package:meteor/meteor.dart';
import 'package:meteor/src/one_core/_it.dart';
import 'package:meteor/src/one_core/navigation/router/one_route.dart';

import 'one_bind.dart';

abstract class OneModuleContext {
  List<OneBindContract> get binds;

  List<OneRouteContext> get routes;

  void registerBinds(OneInjector injector);

  void unRegisterBinds();
}

abstract class OneModuleImpl extends OneModuleContext {
  @override
  List<OneBindContract> get binds => const [];

  @override
  List<OneRoute> get routes => const [];

  final List<OneBindContract> _binds = [];

  OneModuleImpl() {
    _binds.addAll(binds);
  }

  @override
  void registerBinds(OneInjector injector) {
    for (var element in _binds) {
      element.bind(injector);
    }
  }

  @override
  void unRegisterBinds() {
    for (var element in _binds) {
      element.unBind();
    }
  }
}

class OneModule extends OneModuleImpl {
  @override
  List<OneBind> get binds => const [];

  @override
  List<OneRoute> get routes => const [];
}
