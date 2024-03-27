import 'package:app/health/health_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthNotifier extends BlocListener<HealthBloc, HealthState> {
  const HealthNotifier({super.key}) : super(listener: _listener);

  static void _listener(BuildContext context, HealthState state) {
    final err = state.error;
    if (err != null) {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(content: Text(err)),
      );
    } else if (state.shouldShow || kDebugMode) {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (state.code != null)
                Text(
                  'code: ${state.code}',
                ),
              if (state.message != null)
                Text(
                  'message: ${state.message}',
                ),
              if (state.data != null)
                Text(
                  'data: ${state.data}',
                ),
              if (state.error != null)
                Text(
                  'error: ${state.error}',
                ),
            ],
          ),
        ),
      );
    }
  }
}
