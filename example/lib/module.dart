// import 'package:example/main.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:vrouter/vrouter.dart';
//
// abstract class MModule {
//   List<MBind> get binds => const [];
//
//   List<RouteContext> get routes => const [];
// }
//
// abstract class BindContext {}
//
// class MBind extends BindContext {}
//
// abstract class RouteContext {}
//
// class RouteImpl extends RouteContext {
//   final String path;
//   final Widget Function(BuildContext context, dynamic state) child;
//   final List<RouteContext> routes;
//
//   RouteImpl({required this.path, required this.child, this.routes = const []});
// }
//
// class StackRoute extends RouteImpl {
//   StackRoute({required super.path, required super.child,super.routes});
// }
//
// class ModuleRoute extends RouteContext {
//   final String path;
//   final MModule module;
//
//   ModuleRoute({required this.path, required this.module});
// }
//
// class MApp extends StatefulWidget {
//   final MModule module;
//
//   const MApp({Key? key, required this.module}) : super(key: key);
//
//   @override
//   State<MApp> createState() => _MAppState();
// }
//
// class _MAppState extends State<MApp> {
//   List<VRouteElement> routes = [];
//
//   @override
//   initState() {
//     super.initState();
//     final root = VPath(
//         path: '/',
//         stackedRoutes: widget.module.routes.map((e) {
//           if (e is StackRoute) {
//             return VWidget.builder(path: e.path, builder: e.child);
//           }
//           return VWidget(path: '', widget: SizedBox());
//         }).toList());
//     routes.add(root);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return VRouter(
//       routes: routes,
//     );
//   }
// }
//
// Widget startModule(MModule module) {
//   List<VRouteElement> routes = [];
//   final root = parsingModule(module);
//   routes.add(root);
//   return VRouter(
//     routes: routes,
//   );
// }
//
// VRouteElement parsingModule(MModule module) {
//   VRouteElement element = VGuard(
//     beforeEnter: (_) async {
//       print("绑定模块 ${module.runtimeType}");
//       for (var element in module.binds) {}
//       return;
//     },
//     beforeLeave: (_, __) async {
//       print("解绑模块${module.runtimeType}");
//     },
//     stackedRoutes: [
//       VPath(path: '/', stackedRoutes: module.routes.map((e) => parsingRoute(e)).toList()),
//     ],
//   );
//   return element;
// }
//
// VRouteElement parsingRoute(RouteContext e) {
//   if (e is StackRoute) {
//     return VWidget.builder(path: e.path, builder: e.child, stackedRoutes: e.routes.map((e) => parsingRoute(e)).toList());
//   }
//   if (e is ModuleRoute) {
//     return parsingModule(e.module);
//   }
//   return VWidget(path: '', widget: SizedBox());
// }
