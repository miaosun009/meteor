import 'dart:async';

import 'package:meteor/meteor.dart';

abstract class MeteorNavigator {
  MeteorRoute get root;

  List<MeteorRoute> get navigateHistory;

  Future<void> navigate(String path, {dynamic arguments});
}

class MeteorNavigatorImpl implements MeteorNavigator {
  @override
  List<MeteorRoute> get navigateHistory => Modular.to.navigateHistory.cast<MeteorRoute>();

  @override
  MeteorRoute get root => navigateHistory.last;

  @override
  Future<void> navigate(String path, {dynamic arguments}) {
    Modular.to.navigate(path, arguments: arguments);
    return Future.delayed(const Duration(milliseconds: 0), () {});
  }
}
