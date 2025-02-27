import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class AccountListPage extends StatelessWidget {
  const AccountListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShadButton(child: Text('account list'), onPressed: () {}),
    );
  }
}
