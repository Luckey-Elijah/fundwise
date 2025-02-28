import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:fundwise/components/builder_background.dart';

class FundwiseRoute extends CustomRoute<CustomRouteType> {
  FundwiseRoute(
    String path, {
    required super.page,
    RouteTransitionsBuilder? transitionsBuilder,
    super.initial,
    super.children,
  }) : super(
         barrierDismissible: false,
         path: path,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final builder = transitionsBuilder ?? TransitionsBuilders.noTransition;
           return builder(context, animation, secondaryAnimation, BuilderBackground(child: child));
         },
       );
}
