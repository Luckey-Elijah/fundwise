import 'package:app/components/status.dart';
import 'package:app/dashboard_shell/logout_button.dart';
import 'package:app/repository/user.model.dart';
import 'package:app/repository/user.repo.dart';
import 'package:app/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(userRepository: context.read<UserRepository>())
            ..add(InitilaizeUserEvent()),
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
                final user = state.user;
                if (user == null) return const SizedBox.shrink();
                final UserModel(:verified, :username, :email, :name) = user;
                return Column(
                  children: [
                    Text(verified ? 'Verified' : 'Not Verified'),
                    Text(username),
                    Text(email),
                    Text(name),
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
