import 'package:flutter/material.dart';

enum FundwiseStatus { initial, success, loaded, loading, error }

class StatusBuilder extends StatelessWidget {
  const StatusBuilder(
    this.status, {
    this.child = const SizedBox.shrink(),
    this.initialBuilder,
    this.successBuilder,
    this.loadedBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.defaultBuilder,
    super.key,
  });

  final Widget child;
  final FundwiseStatus status;
  final Widget Function(BuildContext context, Widget child)? initialBuilder;
  final Widget Function(BuildContext context, Widget child)? successBuilder;
  final Widget Function(BuildContext context, Widget child)? loadedBuilder;
  final Widget Function(BuildContext context, Widget child)? loadingBuilder;
  final Widget Function(BuildContext context, Widget child)? errorBuilder;
  final Widget Function(BuildContext context, Widget child)? defaultBuilder;

  @override
  Widget build(BuildContext context) {
    late final defaultWidget = defaultBuilder?.call(context, child) ?? child;
    return switch (status) {
      FundwiseStatus.initial =>
        initialBuilder?.call(context, child) ?? defaultWidget,
      FundwiseStatus.success =>
        successBuilder?.call(context, child) ?? defaultWidget,
      FundwiseStatus.loaded =>
        loadedBuilder?.call(context, child) ?? defaultWidget,
      FundwiseStatus.loading =>
        loadingBuilder?.call(context, child) ?? defaultWidget,
      FundwiseStatus.error =>
        errorBuilder?.call(context, child) ?? defaultWidget,
    };
  }
}
