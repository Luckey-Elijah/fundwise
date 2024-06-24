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
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(
      text: context.read<ServerCubit>().state.url?.toString(),
    );

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
    return Row(
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
        BlocSelector<ServerCubit, ServerState, Uri?>(
          selector: (state) => state.url,
          builder: (context, url) {
            return ElevatedButton(
              onPressed: url == null ? null : context.read<ServerCubit>().check,
              child: const Text('check'),
            );
          },
        ),
      ],
    );
  }
}
