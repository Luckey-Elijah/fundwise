import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/components/material.dart';
import 'package:fundwise/health/health.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HealthCheckButton extends ConsumerWidget {
  const HealthCheckButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final health = ref.watch(healthProvider);
    final variant = switch (health) {
      AsyncData(:final value) when value.status != 200 => ShadButtonVariant.destructive,
      AsyncError() => ShadButtonVariant.destructive,
      _ => ShadButtonVariant.ghost,
    };

    final icon = switch (health) {
      AsyncData(:final value) when value.status != 200 => LucideIcons.heartOff,
      AsyncError() => LucideIcons.heartOff,
      AsyncLoading() => LucideIcons.heartOff,
      _ => LucideIcons.heart,
    };

    return ShadTooltip(
      reverseDuration: Durations.short1,
      builder: (_) => HealthMessage(),
      child: ShadIconButton.raw(
        icon: Icon(icon),
        variant: variant,
        enabled: !health.isLoading,
        onPressed: () => ref.invalidate(healthProvider),
      ),
    );
  }
}

class HealthMessage extends ConsumerWidget {
  const HealthMessage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(
      healthProvider.select(
        (health) => switch (health) {
          AsyncError(:final error) => '$error',
          AsyncValue(:final value?) => value.message,
          _ => null,
        },
      ),
    );
    if (message == null) return SizedBox(width: 40, child: ShadProgress());
    return Text(message);
  }
}
