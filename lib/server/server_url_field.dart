import 'package:app/components/status.dart';
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

  void listener() => context.read<ServerCubit>().updateUrl(controller.text);

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServerCubit, ServerState>(
      listenWhen: (_, s) => s.url.valid && ('${s.url}' != controller.text),
      listener: (_, s) => controller.text = '${s.url}',
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                autofillHints: const [AutofillHints.url],
                decoration: InputDecoration(
                  hintText: 'server url',
                  suffixIcon: _icon(state, context.primary),
                  errorText: switch (state.healthy) {
                    false => 'API is not healthy',
                    _ => null,
                  },
                ),
              ),
            ),
            const Gutter(),
            ElevatedButton(
              onPressed: state.url != null
                  ? context.read<ServerCubit>().check //
                  : null,
              child: const Text('test'),
            ),
          ],
        );
      },
    );
  }
}

Widget? _icon(ServerState state, Color primary) {
  return switch ((state.healthy, state.status)) {
    (_, FundwiseStatus.loading) => const CircularProgressIndicator.adaptive(),
    (_, FundwiseStatus.error) => const Icon(Icons.error),
    (false, _) => const Icon(Icons.error),
    (true, _) => Icon(Icons.verified, color: primary),
    _ => Icon(Icons.help, color: primary),
  };
}
