import 'package:meteor/meteor.dart';

abstract class OneBase {
  B get<B extends Object>();

  Future<B> getAsync<B extends Object>();
}

class OneBaseImpl extends OneBase {
  final OneInjector injector;

  OneBaseImpl(this.injector);

  @override
  B get<B extends Object>() {
    return injector.call<B>();
  }

  @override
  Future<B> getAsync<B extends Object>() {
    // TODO: implement getAsync
    throw UnimplementedError();
  }
}

OneBase? _oneBase;

OneBase get one {
  _oneBase ??= oneInjector.get<OneBase>();
  return _oneBase!;
}
