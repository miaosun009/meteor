import 'package:flutter/cupertino.dart';
import 'package:meteor/src/one_core/_it.dart';
import 'package:meteor/src/one_core/injector.dart';

abstract class OneBindContract<T extends Object> {
  final T Function(OneInjector injector) factoryFunction;

  Type get bindType => T;

  /// 单例模式
  bool singleton;

  /// 懒加载
  final bool lazy;

  OneBindContract(
    this.factoryFunction, {
    this.singleton = true,
    this.lazy = true,
  });

  void bind(OneInjector injector);

  void unBind();

  OneBindContract<T> copyWith({T Function(OneInjector injector)? factoryFunction, bool? singleton, bool? lazy});
}

class OneBindContractImpl<T extends Object> extends OneBindContract<T> {
  OneBindContractImpl(super.factoryFunction, {super.lazy, super.singleton});

  @override
  OneBindContract<T> copyWith({T Function(OneInjector injector)? factoryFunction, bool? singleton, bool? lazy}) {
    return OneBindContractImpl(factoryFunction ?? this.factoryFunction, singleton: singleton ?? this.singleton, lazy: lazy ?? this.lazy);
  }

  @override
  void bind(OneInjector injector) {
    if (singleton) {
      if (lazy) {
        OneIt.registerLazySingleton<T>(() => factoryFunction.call(injector));
      } else {
        var instance = factoryFunction.call(injector);
        OneIt.registerSingleton<T>(instance);
      }
    } else {
      OneIt.registerFactory<T>(() => factoryFunction.call(injector));
    }
    debugPrint("注册绑定:$bindType");
  }

  @override
  void unBind() {
    OneIt.unregister<T>();
    debugPrint("取消绑定:$bindType");
  }
}

class OneBind<T extends Object> extends OneBindContractImpl<T> {
  OneBind(super.factoryFunction, {super.singleton, super.lazy});

  factory OneBind.instance(T instance) {
    return OneBind((i) => instance, lazy: true, singleton: false);
  }

  factory OneBind.singleton(T Function(OneInjector injector) inject) {
    return OneBind(inject, lazy: false, singleton: true);
  }

  factory OneBind.lazySingleton(T Function(OneInjector injector) inject) {
    return OneBind(inject, lazy: true, singleton: true);
  }

  factory OneBind.factory(T Function(OneInjector injector) inject) {
    return OneBind(inject, lazy: true, singleton: false);
  }
}

class OneEmptyBind extends OneBindContractImpl<Object> {
  OneEmptyBind() : super((i) => Object());
}
