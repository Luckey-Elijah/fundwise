import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class AccountDetailPage extends StatelessWidget {
  const AccountDetailPage({@PathParam() required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Center(child: ShadButton(child: Text('account: $id')));
  }
}
