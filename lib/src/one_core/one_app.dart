import 'package:flutter/cupertino.dart';
import 'package:meteor/src/one_core/module/one_module.dart';
import 'package:meteor/src/one_core/one_core.dart';

class OneModuleApp extends StatefulWidget {
  final OneModule module;
  final Widget child;

  const OneModuleApp({Key? key, required this.module, required this.child}) : super(key: key);

  @override
  State<OneModuleApp> createState() => _OneModuleAppState();
}

class _OneModuleAppState extends State<OneModuleApp> {
  @override
  initState() {
    super.initState();
    oneInjector.registerModule(widget.module);
  }


  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

