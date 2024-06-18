import 'package:app/components/context_extension.dart';
import 'package:app/components/status.dart';
import 'package:app/dashboard_shell/logout_button.dart';
import 'package:app/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => UserBloc(c.pb)..add(InitilaizeUserEvent()),
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const LogoutButton(),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return StatusBuilder(
              state.status,
              loadedBuilder: (context) {
                return Column(
                  children: [
                    if (state.verified != null)
                      Text(state.verified! ? 'Verified' : 'Not Verified'),
                    if (state.id != null) Text(state.id!),
                    if (state.username != null) Text(state.username!),
                    if (state.email != null) Text(state.email!),
                    if (state.name != null) Text(state.name!),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
