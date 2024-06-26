import 'package:app/budget_select/budget_select_bloc.dart';
import 'package:app/repository/budget.repo.dart';
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
          context.go('/budgets/${state.budget.id}');
        }
      },
      listenWhen: (prev, next) =>
          prev is! DefaultBudgetSelected || next is DefaultBudgetSelected,
      builder: (context, state) {
        if (state is InitialBudgetSelectState ||
            state is DefaultBudgetSelected) {
          return const CircularProgressIndicator.adaptive();
        }
        if (state is ListBudgetSelection) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final budget = state.budgets[index];

              return Card.outlined(
                key: ValueKey(budget.id),
                color: Theme.of(context).colorScheme.primaryContainer,
                child: InkWell(
                  onTap: () {
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
                                Text(
                                  currencyFormatter(
                                    ///        $1,456.90 => the last 8 should be dropped
                                    milliunits: 1456908,
                                    format: FundwiseCurrencyFormat(
                                      decimalDigits: 2,
                                      groupSize: 3,
                                      decimalSeperator: '.',
                                      groupSeperator: ',',
                                      symbol: r'$',
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
                          Icons.chevron_right,
                          size: 48,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: state.budgets.length,
          );
        }
        throw UnimplementedError('$state');
      },
    );
  }
}

String currencyFormatter({
  required FundwiseCurrencyFormat format,
  required int milliunits,
}) {
  final buff = StringBuffer();
  if (format.symbolFirst) buff.write(format.symbol);
  final chars = '$milliunits'.split('');
  // split at decimal

  final splitIndex = chars.length - 3;
  final wholes = [...chars.take(splitIndex)];

  for (var i = 0; i < wholes.length; i++) {
    final seperate = (i - 1) % format.groupSize == 0;
    if (seperate) buff.write(format.groupSeperator);
    buff.write(wholes[i]);
  }

  final decimals = [...chars.skip(splitIndex)];

  buff.write(format.decimalSeperator);

  for (var i = 0; i < format.decimalDigits; i++) {
    if (i > decimals.length) {
      buff.write('0');
    } else {
      buff.write(decimals[i]);
    }
  }

  if (!format.symbolFirst) buff.write(format.symbol);
  return '$buff';
}

class FundwiseCurrencyFormat {
  FundwiseCurrencyFormat({
    required this.decimalDigits,
    required this.groupSize,
    required this.decimalSeperator,
    required this.groupSeperator,
    required this.symbol,
    required this.displaySymbol,
    required this.symbolFirst,
  })  : assert(decimalDigits >= 0, '[decimalDigits] must be non-negative.'),
        assert(groupSize >= 0, '[groupSize] must be non-negative.');

  final int decimalDigits;
  final int groupSize;
  final String decimalSeperator;
  final String groupSeperator;
  final String symbol;
  final bool displaySymbol;
  final bool symbolFirst;
}
