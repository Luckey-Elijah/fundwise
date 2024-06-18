import 'package:flutter/material.dart';

enum FundwiseStatus { initial, success, loaded, loading, error }

class StatusBuilder extends StatelessWidget {
  const StatusBuilder(
    this.status, {
    this.initialBuilder,
    this.successBuilder,
    this.loadedBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.defaultBuilder,
    super.key,
  });

  final FundwiseStatus status;
  final WidgetBuilder? initialBuilder;
  final WidgetBuilder? successBuilder;
  final WidgetBuilder? loadedBuilder;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;
  final WidgetBuilder? defaultBuilder;

  @override
  Widget build(BuildContext context) {
    late final defaultWidget =
        defaultBuilder?.call(context) ?? const SizedBox.shrink();
    return switch (status) {
      FundwiseStatus.initial => initialBuilder?.call(context) ?? defaultWidget,
      FundwiseStatus.success => successBuilder?.call(context) ?? defaultWidget,
      FundwiseStatus.loaded => loadedBuilder?.call(context) ?? defaultWidget,
      FundwiseStatus.loading => loadingBuilder?.call(context) ?? defaultWidget,
      FundwiseStatus.error => errorBuilder?.call(context) ?? defaultWidget,
    };
  }
}
