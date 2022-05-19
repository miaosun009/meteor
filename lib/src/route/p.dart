// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:meteor/src/route/router_delegate.dart';
//
// import '../../meteor.dart';
// import '../modular_export.dart';
// import '../meteor.dart';
// import 'book.dart';
//
// class MeteorRouteInformationParser extends RouteInformationParser<MeteorBook> {
//   @override
//   Future<MeteorBook> parseRouteInformation(RouteInformation routeInformation) async {
//     return injector<ModularRouteInformationParser>().parseRouteInformation(routeInformation).then<MeteorBook>((value) => MeteorBook(routes: value.routes.cast<ChildRoute>()));
//   }
//
//   @override
//   RouteInformation restoreRouteInformation(MeteorBook configuration) {
//     final config = ModularBook(routes: configuration.routes);
//     return injector<ModularRouteInformationParser>().restoreRouteInformation(config);
//   }
//
//   Future<MeteorBook> selectBook(String path, {dynamic arguments, void Function(dynamic)? popCallback}) async {
//     return injector<ModularRouteInformationParser>().selectBook(path, arguments: arguments, popCallback: popCallback).then<MeteorBook>((value) => MeteorBook(routes: value.routes.cast<ChildRoute>()));
//   }
//
//   FutureOr<MeteorRoute> selectRoute(String path, {dynamic arguments}) async {
//     final route = await injector<ModularRouteInformationParser>().selectRoute(path, arguments: arguments);
//     return route as MeteorRoute;
//   }
// }
