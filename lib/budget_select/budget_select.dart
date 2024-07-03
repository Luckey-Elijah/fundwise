import 'package:app/budget_select/budget_select_bloc.dart';
import 'package:app/formatter.dart';
import 'package:app/repository/budget.repo.dart';
import 'package:app/repository/currency_format.model.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BudgetSelectPage extends StatelessWidget {
  const BudgetSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => BudgetSelectBloc(context.read<BudgetRepository>())
        ..add(
          InitializeBudgetSelectEvent(),
        ),
      child: const BudgetSelectView(),
    );
  }
}

class BudgetSelectView extends StatelessWidget {
  const BudgetSelectView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BudgetSelectBloc, BudgetSelectState>(
      listener: (context, state) {
        if (state is DefaultBudgetSelected) {
          context.go('/budget/${state.budget.id}');
        }
      },
      builder: (context, state) {
        if (state is InitialBudgetSelectState ||
            state is DefaultBudgetSelected) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is ListBudgetSelection || state is InitialBudgetSelectState) {
          return ListView.builder(
            itemCount: state.budgets.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Card.outlined(
                  color: context.primaryContainer,
                  child: InkWell(
                    onTap: () => context.go('/budget/new'),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New Budget',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Row(
                                children: [
                                  const Text('budget.owner'),
                                  const Gutter(),
                                  Text(
                                    DateFormat('MM.d.y').format(DateTime.now()),
                                  ),
                                  const Gutter(),
                                  Text(
                                    currencyFormatter(
                                      milliunits: 10000,
                                      format: CurrencyFormatModel(
                                        decimalSeparator: '.',
                                        groupSeparator: ',',
                                        symbol: r'$',
                                        groupSize: 3,
                                        decimalDigits: 2,
                                        displaySymbol: true,
                                        symbolFirst: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.add,
                            size: 48,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              final budget = state.budgets[index - 1];
              return Card.outlined(
                key: ValueKey(budget.id),
                color: context.secondaryContainer,
                child: InkWell(
                  onTap: () {
                    context
                        .read<BudgetSelectBloc>()
                        .add(SelectBudgetEvent(budget));
                    context.go('/budget/${budget.id}');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              budget.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Row(
                              children: [
                                Text(budget.owner),
                                const Gutter(),
                                Text(
                                  DateFormat(budget.dateFormat)
                                      .format(DateTime.now()),
                                ),
                                const Gutter(),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.chevron_right,
                          size: 48,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        throw UnimplementedError('$state');
      },
    );
  }
}
