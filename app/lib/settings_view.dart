import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';

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

class _SettingsContent extends StatelessWidget {
  const _SettingsContent();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      children: [
        Text('Budget Settings', style: textTheme.bodyMedium),
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
        Text('Accounts Settings', style: textTheme.bodyMedium),
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
                      onPressed: Navigator.of(context).pop,
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text(
                        'Logout',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      onPressed: Navigator.of(context).pop,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        context.marginTheme.large.box,
        Text('Legal', style: textTheme.bodyMedium),
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
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Open Budget', style: textTheme.bodyLarge),
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
                  onPressed: Navigator.of(context).pop,
                  icon: const Icon(Icons.folder_open_rounded),
                  label: const Text('Open'),
                ),
                TextButton.icon(
                  onPressed: Navigator.of(context).pop,
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

class _SettingsHeader extends StatelessWidget {
  const _SettingsHeader();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = AppBarTheme.of(context).toolbarHeight ?? kToolbarHeight;

    return ConstrainedBox(
      constraints: BoxConstraints.loose(Size.fromHeight(height)),
      child: DecoratedBox(
        decoration: context.boxDecorationTheme.boxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Settings',
                style: textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BudgetSettingsDialog extends StatelessWidget {
  const _BudgetSettingsDialog();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Budget Settings', style: textTheme.bodyLarge),
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('Save'),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
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
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('New Budget', style: textTheme.bodyLarge),
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
                  onPressed: Navigator.of(context).pop,
                  icon: const Icon(Icons.create_new_folder_rounded),
                  label: const Text('Create New Budget'),
                ),
                TextButton.icon(
                  onPressed: Navigator.of(context).pop,
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
