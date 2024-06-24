import 'package:app/components/positioned_overlay_builder.dart';
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
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return StatusBuilder(
          state.status,
          child: const LogoutButton(),
          loadedBuilder: (context, child) {
            final user = state.user;
            if (user == null) return const SizedBox.shrink();
            final UserModel(:verified, :username, :email, :name) = user;
            return Wrap(
              spacing: 16,
              children: [
                child,
                EditEmailButton(email: email, verified: verified),
                Text(username),
                Text(name),
              ],
            );
          },
        );
      },
    );
  }
}

class EditEmailButton extends StatelessWidget {
  const EditEmailButton({
    required this.email,
    required this.verified,
    super.key,
  });

  final String email;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return PositionedOverlayBuilder(
      anchorBuilder: (context, controller) {
        final colors = Theme.of(context).colorScheme;
        return TextButton.icon(
          iconAlignment: IconAlignment.end,
          onPressed: controller.toggle,
          label: Text(email),
          icon: Icon(
            verified ? Icons.verified : Icons.warning,
            color: verified ? colors.primary : colors.secondary,
          ),
        );
      },
      overlayChildBuilder: (context, controller, size, origin) {
        final bottomCenter = size.bottomCenter(origin);
        return PositonedOverlayCard(
          position: bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!verified)
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.warning),
                  label: const Text('Send Verification'),
                ),
              TextButton(
                onPressed: () {},
                child: const Text('Change Email'),
              ),
              TextButton(
                onPressed: controller.hide,
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }
}
