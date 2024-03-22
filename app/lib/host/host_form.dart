import 'package:app/host/host_bloc.dart';
import 'package:app/host/host_state.dart';
import 'package:app/theme_extension/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HostForm extends StatefulWidget {
  const HostForm({
    super.key,
  });

  @override
  State<HostForm> createState() => _HostFormState();
}

class _HostFormState extends State<HostForm> {
  TextEditingController? controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (controller == null) {
      final state = context.read<HostBloc>().state;
      final url = state.url?.toString() ?? state.maybeUrl;
      controller = TextEditingController(text: url);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: context.decorationTheme.primary,
        child: ConstrainedBox(
          constraints: context.decorationTheme.smallWidth,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: BlocBuilder<HostBloc, HostState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.toString()),
                    TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                      ],
                      autofillHints: const [AutofillHints.url],
                      controller: controller,
                      onChanged: (value) =>
                          context.read<HostBloc>().add(UpdateUri(value)),
                      decoration: InputDecoration(
                        hintText: 'url',
                        errorText: state.status == HostStatus.error
                            ? 'please provide a valid url'
                            : null,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
