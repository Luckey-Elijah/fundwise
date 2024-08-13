import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';

class FundwiseInk extends StatelessWidget {
  const FundwiseInk({
    required this.child,
    this.color,
    this.onPrimary,
    this.onSecondary,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    super.key,
  }) : _type = null;

  const FundwiseInk.primary({
    required this.child,
    this.onPrimary,
    this.onSecondary,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    super.key,
  })  : _type = _FundwiseInkType.primary,
        color = null;
  const FundwiseInk.secondary({
    required this.child,
    this.onPrimary,
    this.onSecondary,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    super.key,
  })  : _type = _FundwiseInkType.secondary,
        color = null;

  const FundwiseInk.tertiary({
    required this.child,
    this.onPrimary,
    this.onSecondary,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    super.key,
  })  : _type = _FundwiseInkType.tertiary,
        color = null;

  const FundwiseInk.error({
    required this.child,
    this.onPrimary,
    this.onSecondary,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    super.key,
  })  : _type = _FundwiseInkType.error,
        color = null;

  final Widget child;
  final _FundwiseInkType? _type;
  final Color? color;
  final BorderRadius borderRadius;
  final VoidCallback? onPrimary;
  final VoidCallback? onSecondary;

  @override
  Widget build(BuildContext context) {
    final color = switch (_type) {
      _FundwiseInkType.primary => context.primaryContainer,
      _FundwiseInkType.secondary => context.secondaryContainer,
      _FundwiseInkType.tertiary => context.secondaryContainer,
      _FundwiseInkType.error => context.errorContainer,
      null => this.color,
    };

    return Material(
      borderRadius: borderRadius,
      color: color,
      child: InkWell(
        onTap: onPrimary,
        onLongPress: onSecondary,
        onSecondaryTap: onSecondary,
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}

enum _FundwiseInkType {
  primary,
  secondary,
  tertiary,
  error,
}
