import 'package:flutter/foundation.dart';
import 'package:meteor/src/one_core/_it.dart';
import 'package:meteor/src/one_core/module/one_module.dart';

abstract class OneInjector<T> {
  B call<B extends Object>() => get<B>();

  B get<B extends Object>();

  void registerModule(OneModuleContext module);
}

class OneInjectorImpl<T> extends OneInjector<T> {
  final Map<Type, OneModuleContext> _modules = {};

  @override
  B get<B extends Object>() {
    if (OneIt.isRegistered<B>()) {
      return OneIt.get<B>();
    }
    throw '找不到:$B';
  }

  @override
  registerModule(OneModuleContext module) {
    final type = module.runtimeType;
    if (_modules.containsKey(type) == false) {
      debugPrint("注册模块:$type");
      _modules[type] = module;
      module.registerBinds(this);
    }
  }

  unRegisterModule<B extends OneModuleContext>() {
    final module = _modules.remove(B);
    if (module != null) {
      debugPrint("解绑模块:${module.runtimeType}");
      module.unRegisterBinds();
    }
  }
}
