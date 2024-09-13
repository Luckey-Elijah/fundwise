import 'package:app/server/server.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ServerUrlField extends StatefulWidget {
  const ServerUrlField({super.key});

  @override
  State<ServerUrlField> createState() => _ServerUrlFieldState();
}

class _ServerUrlFieldState extends State<ServerUrlField> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(listener);
    super.initState();
  }

  ServerCubit get cubit => context.read<ServerCubit>();

  void listener() => cubit.updateUrl(controller.text);

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select<ServerCubit, ServerState>((c) => c.state);

    return BlocListener<ServerCubit, ServerState>(
      listenWhen: (previous, next) =>
          next.url.valid && ('${next.url}' != controller.text),
      listener: (context, state) => controller.text = '${state.url}',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              autofillHints: const [AutofillHints.url],
              decoration: InputDecoration(
                hintText: 'server url',
                suffixIcon: switch (state.healthy) {
                  true => Icon(
                      Icons.verified,
                      color: context.primary,
                    ),
                  false => const Icon(Icons.error),
                  _ => null,
                },
                errorText: switch (state.healthy) {
                  false => 'API is not healthy',
                  _ => null,
                },
              ),
            ),
          ),
          const Gutter(),
          ElevatedButton(
            onPressed: state.url != null ? cubit.check : null,
            child: const Text('test'),
          ),
        ],
      ),
    );
  }
}
