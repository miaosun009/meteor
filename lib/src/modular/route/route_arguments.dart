import 'package:modular_core/modular_core.dart';

extension ModularArgumentsExtension on ModularArguments {
  RouteArguments toRouteArguments() {
    return RouteArguments(uri: uri, params: params, data: data);
  }
}

class RouteArguments extends ModularArguments {
  RouteArguments({required super.uri, super.params, super.data});

  @override
  RouteArguments copyWith({Map<String, dynamic>? params, dynamic data, Uri? uri}) {
    return RouteArguments(
      params: params ?? this.params,
      data: data ?? this.data,
      uri: uri ?? this.uri,
    );
  }
}