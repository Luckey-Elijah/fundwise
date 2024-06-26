import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class BudgetNewPage extends StatelessWidget {
  const BudgetNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New Budget',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Gutter(),
        Expanded(
          child: ListView(
            children: const [
              FormRow(label: 'name', child: TextField()),
              FormRow(label: 'date format', child: TextField()),
              FormRow(label: 'currency format', child: TextField()),
            ],
          ),
        ),
      ],
    );
  }
}

class FormRow extends StatelessWidget {
  const FormRow({
    required this.label,
    required this.child,
    super.key,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Row(
        children: [
          Expanded(
            child: Text(label),
          ),
          // const Gutter(),
          Expanded(child: child),
        ],
      ),
    );
  }
}
