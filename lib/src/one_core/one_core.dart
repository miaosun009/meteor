import 'package:meteor/src/one_core/injector.dart';
import 'package:meteor/src/one_core/module/one_bind.dart';
import 'package:meteor/src/one_core/module/one_module.dart';
import 'package:meteor/src/one_core/one_base.dart';

OneInjector? _injector;

OneInjector get oneInjector {
  _injector ??= OneInjectorImpl()..registerModule(OneInitModule());
  return _injector!;
}

void cleanOneInjector() {
  _injector = null;
}

class OneInitModule extends OneModule {
  @override
  get binds => [
        OneBind<OneInjector>((i) => oneInjector),
        OneBind<OneBase>((i) => OneBaseImpl(i())),
      ];
}
