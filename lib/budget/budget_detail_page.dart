import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class BudgetDetailPage extends StatelessWidget {
  const BudgetDetailPage({@PathParam() required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(children: [Text(id, style: theme.textTheme.large), const Placeholder()]);
  }
}
