import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meteor/meteor.dart';

import 'init_module.dart';
import 'former_export.dart';

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
    injector.addBindContext(InitModule());
  }

  @override
  void dispose() {
    super.dispose();
    meteorClear();
  }

  @override
  Widget build(BuildContext context) {
    return ModularApp(module: widget.module, child: widget.child);
  }
}

meteorRun({required Module module, required Widget child}) {
  runZonedGuarded(() {
    runApp(MeteorApp(
      module: module,
      child: child,
    ));
  }, (error, stack) {
    if (error is GuardedRouteException || error is RouteNotFoundException || error is BindNotFoundException) {
      print((error as Exception).toString());
      return;
    }
    throw error;
  });
}
