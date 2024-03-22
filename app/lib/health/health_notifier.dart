import 'package:app/health/health_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthNotifier extends BlocListener<OnlineBloc, OnlineState> {
  const HealthNotifier({super.key}) : super(listener: _listener);

  static void _listener(BuildContext context, OnlineState state) {
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
              /* Flexible(
                child:  */
              Text('code: ${state.code}'),
              // ),
              /* Flexible(
                child:  */
              Text('message: ${state.message}'),
              // ),
              /* Flexible(
                child:  */
              Text('data: ${state.data}'),
              // ),
              /* Flexible(
                child:  */
              Text('error: ${state.error}'),
              // ),
            ],
          ),
        ),
      );
    }
  }
}
