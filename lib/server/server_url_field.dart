import 'package:app/components/status.dart';
import 'package:app/components/value_notifier_listener.dart';
import 'package:app/server/server_store.dart';
import 'package:context_plus/context_plus.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ServerUrlField extends StatefulWidget {
  const ServerUrlField({super.key});

  @override
  State<ServerUrlField> createState() => ServerUrlFieldState();
}

typedef _Listener
    = ValueNotifierListener<ServerState, ServerStore, ServerUrlField>;

class ServerUrlFieldState extends State<ServerUrlField> with _Listener {
  @override
  ServerStore get notifier => server$;

  final controller = TextEditingController();

  @override
  void listen(ServerState previous, ServerState next) {
    if (previous.url == null &&
        previous.status == FundwiseStatus.initial &&
        next.status == FundwiseStatus.loaded &&
        next.url != null) {
      controller.text = '${next.url}';
    }
  }

  @override
  void initState() {
    controller.addListener(listener);
    super.initState();
  }

  void listener() => server$.updateUrl(controller.text);

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = server$.watch(context);

    return Row(
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
          onPressed: state.url != null ? server$.check : null,
          child: const Text('test'),
        ),
      ],
    );
  }
}
