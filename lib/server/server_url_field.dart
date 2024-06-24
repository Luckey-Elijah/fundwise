import 'package:app/components/status.dart';
import 'package:app/server/server_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ServerUrlField extends StatefulWidget {
  const ServerUrlField({super.key});

  @override
  State<ServerUrlField> createState() => ServerUrlFieldState();
}

class ServerUrlFieldState extends State<ServerUrlField> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(listener);
    super.initState();
  }

  void listener() {
    context.read<ServerCubit>().updateUrl(controller.text);
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServerCubit, ServerState>(
      listener: (context, state) {
        final url = state.url;
        if (url == null) return;
        debugPrint('updateing controller [url]: $url');
        controller.text = '$url';
      },
      listenWhen: (prev, next) =>
          prev.url == null &&
          prev.status == FundwiseStatus.initial &&
          next.status == FundwiseStatus.loaded,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BlocSelector<ServerCubit, ServerState, bool?>(
              selector: (state) => state.healthy,
              builder: (context, healthy) {
                return TextField(
                  controller: controller,
                  autofillHints: const [AutofillHints.url],
                  decoration: InputDecoration(
                    hintText: 'server url',
                    suffixIcon: switch (healthy) {
                      true => Icon(
                          Icons.verified,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      false => const Icon(Icons.error),
                      _ => null,
                    },
                    errorText: switch (healthy) {
                      false => 'API is not healthy',
                      _ => null,
                    },
                  ),
                );
              },
            ),
          ),
          const Gutter(),
          BlocSelector<ServerCubit, ServerState, bool>(
            selector: (state) => state.url != null,
            builder: (context, canTest) {
              return ElevatedButton(
                onPressed: canTest ? context.read<ServerCubit>().check : null,
                child: const Text('test'),
              );
            },
          ),
        ],
      ),
    );
  }
}
