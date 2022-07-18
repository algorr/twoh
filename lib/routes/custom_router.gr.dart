// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../models/machines.dart' as _i5;
import '../view/home_view.dart' as _i1;
import '../view/machine_detail_view.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeView());
    },
    MachineDetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<MachineDetailViewRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.MachineDetailView(key: args.key, machine: args.machine));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HomeViewRoute.name, path: '/'),
        _i3.RouteConfig(MachineDetailViewRoute.name,
            path: '/machine-detail-view')
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i3.PageRouteInfo<void> {
  const HomeViewRoute() : super(HomeViewRoute.name, path: '/');

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [_i2.MachineDetailView]
class MachineDetailViewRoute
    extends _i3.PageRouteInfo<MachineDetailViewRouteArgs> {
  MachineDetailViewRoute({_i4.Key? key, required _i5.Machines machine})
      : super(MachineDetailViewRoute.name,
            path: '/machine-detail-view',
            args: MachineDetailViewRouteArgs(key: key, machine: machine));

  static const String name = 'MachineDetailViewRoute';
}

class MachineDetailViewRouteArgs {
  const MachineDetailViewRouteArgs({this.key, required this.machine});

  final _i4.Key? key;

  final _i5.Machines machine;

  @override
  String toString() {
    return 'MachineDetailViewRouteArgs{key: $key, machine: $machine}';
  }
}
