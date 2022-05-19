import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:meteor/meteor.dart';
import 'package:meteor/src/modular_export.dart';
import 'package:meteor/src/route/p.dart';
import 'package:modular_core/modular_core.dart';
import './route/router_delegate.dart';

import 'core/meteor_base.dart';
import 'core/meteor_navigator.dart';

MeteorBase? _meteor;
// ignore: non_constant_identifier_names
MeteorBase get Meteor {
  return _meteor ??= injector<MeteorBase>();
}

class MeteorModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<MeteorNavigator>((i) => MeteorNavigatorImpl()),
        Bind.lazySingleton<MeteorBase>((i) => MeteorBaseImpl(i())),
      ];
}

// class MeteorApp extends ModularApp{
//   MeteorApp({Key? key, required super.module, required super.child}) : super(key: key);
// }

class MeteorApp extends StatefulWidget {
  final Module module;
  final Widget child;

  const MeteorApp({Key? key, required this.module, required this.child}) : super(key: key);

  @override
  State<MeteorApp> createState() => _MeteorAppState();
}

class _MeteorAppState extends State<MeteorApp> {
  @override
  initState() {
    super.initState();
    injector.addBindContext(MeteorModule());
  }

  @override
  void dispose() {
    super.dispose();
    _meteor = null;
  }

  @override
  Widget build(BuildContext context) {
    return ModularApp(module: widget.module, child: widget.child);
  }
}
