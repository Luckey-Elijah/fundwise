import 'package:app/auth/auth_bloc.dart';
import 'package:app/components/primary_header.dart';
import 'package:app/theme_extension/theme.dart';
import 'package:app/utility/build_context.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _SettingsHeader(),
        Expanded(child: _SettingsContent()),
      ],
    );
  }
}

class _SettingsHeader extends StatelessWidget {
  const _SettingsHeader();

  @override
  Widget build(BuildContext context) {
    return PrimaryHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Settings',
            style: context.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}

class _SettingsContent extends StatelessWidget {
  const _SettingsContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Budget Settings', style: context.textTheme.bodyMedium),
        context.marginTheme.small.box,
        Wrap(
          children: [
            TextButton.icon(
              icon: const Icon(Icons.settings_rounded),
              label: const Text(
                'Budget Settings',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              onPressed: () => showDialog<void>(
                context: context,
                builder: (context) => const _BudgetSettingsDialog(),
              ),
            ),
            TextButton.icon(
              icon: const Icon(Icons.folder_open_rounded),
              label: const Text(
                'Open Budget',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onPressed: () => showDialog<void>(
                context: context,
                builder: (context) => const _BudgetPickerDialog(),
              ),
            ),
            context.marginTheme.small.box,
            TextButton.icon(
              icon: const Icon(Icons.create_new_folder_rounded),
              label: const Text(
                'New Budget',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onPressed: () => showDialog<void>(
                context: context,
                builder: (context) => const _NewBudgetDialog(),
              ),
            ),
          ],
        ),
        context.marginTheme.large.box,
        Text('Accounts Settings', style: context.textTheme.bodyMedium),
        context.marginTheme.small.box,
        Wrap(
          children: [
            TextButton.icon(
              icon: const Icon(Icons.logout_rounded),
              label: const Text(
                'Logout',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              onPressed: () => showDialog<void>(
                context: context,
                builder: (context) => AlertDialog(
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton.icon(
                      icon: const Icon(Icons.cancel_rounded),
                      label: const Text(
                        'Cancel',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      onPressed: context.pop,
                    ),
                    TextButton.icon(
                      onPressed: () =>
                          context.read<AuthBloc>().add(LogoutEvent()),
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text(
                        'Logout',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        context.marginTheme.large.box,
        Text('Legal', style: context.textTheme.bodyMedium),
        context.marginTheme.small.box,
        Wrap(
          children: [
            TextButton.icon(
              onPressed: () => showAboutDialog(
                context: context,
                applicationName: 'fundwise.dev',
                applicationVersion: '0.0.1',
              ),
              icon: const Icon(Icons.edit_document),
              label: const Text(
                'About',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BudgetPickerDialog extends StatelessWidget {
  const _BudgetPickerDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Open Budget', style: context.textTheme.bodyLarge),
                const CloseButton(),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView(
                children: [
                  const Text('Budget Name'),
                  context.marginTheme.small.box,
                ],
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: context.pop,
                  icon: const Icon(Icons.folder_open_rounded),
                  label: const Text('Open'),
                ),
                TextButton.icon(
                  onPressed: context.pop,
                  icon: const Icon(Icons.cancel_rounded),
                  label: const Text('Cancel'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BudgetSettingsDialog extends StatelessWidget {
  const _BudgetSettingsDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Budget Settings', style: context.textTheme.bodyLarge),
                const CloseButton(),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView(
                children: [
                  const Text('Budget Name'),
                  context.marginTheme.small.box,
                  const TextField(
                    decoration: InputDecoration(hintText: 'Budget Name'),
                  ),
                  context.marginTheme.large.box,
                  const Text('Currency'),
                  context.marginTheme.small.box,
                  const TextField(
                    decoration: InputDecoration(hintText: 'Currency'),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: context.pop,
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('Save'),
                ),
                TextButton.icon(
                  onPressed: context.pop,
                  icon: const Icon(Icons.cancel_rounded),
                  label: const Text('Cancel'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NewBudgetDialog extends StatelessWidget {
  const _NewBudgetDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: context.decorationTheme.mediumWidth,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New Budget', style: context.textTheme.bodyLarge),
                  const CloseButton(),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView(
                  children: [
                    const Text('Budget Name'),
                    context.marginTheme.small.box,
                    const TextField(
                      decoration: InputDecoration(hintText: 'Budget Name'),
                    ),
                    context.marginTheme.large.box,
                    const Text('Currency'),
                    context.marginTheme.small.box,
                    const TextField(
                      decoration: InputDecoration(hintText: 'Currency'),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Wrap(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: context.pop,
                    icon: const Icon(Icons.create_new_folder_rounded),
                    label: const Text('Create New Budget'),
                  ),
                  TextButton.icon(
                    onPressed: context.pop,
                    icon: const Icon(Icons.cancel_rounded),
                    label: const Text('Cancel'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
