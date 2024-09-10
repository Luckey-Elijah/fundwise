import 'package:duck_router/duck_router.dart';
import 'package:flutter/widgets.dart';

class NoTransitionPage<T> extends DuckPage<T> {
  const NoTransitionPage({
    required super.child,
    required super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: noTransitionBuilder,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
}

Widget noTransitionBuilder(
  BuildContext _,
  Animation<double> __,
  Animation<double> ___,
  Widget child,
) =>
    child;
