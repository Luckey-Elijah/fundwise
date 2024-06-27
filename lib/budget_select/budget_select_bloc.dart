import 'dart:async';

import 'package:app/repository/budget.model.dart';
import 'package:app/repository/budget.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BudgetSelectEvent {}

class InitializeBudgetSelectEvent extends BudgetSelectEvent {}

class BudgetSelectBloc extends Bloc<BudgetSelectEvent, BudgetSelectState> {
  BudgetSelectBloc(this.repo) : super(const InitialBudgetSelectState()) {
    on<InitializeBudgetSelectEvent>(_onInitializeBudgetSelectEvent);
  }

  final BudgetRepository repo;

  Future<void> _onInitializeBudgetSelectEvent(
    InitializeBudgetSelectEvent event,
    Emitter<BudgetSelectState> emit,
  ) async {
    final defaultBudget = await repo.getDefaultBudget();
    if (defaultBudget != null) {
      return emit(DefaultBudgetSelected(budget: defaultBudget));
    }

    final budgets = await repo.getBudgets();

    emit(
      ListBudgetSelection(budgets),
    );
  }
}

abstract class BudgetSelectState {
  const BudgetSelectState(this.budgets);
  final List<BudgetSummaryModel> budgets;
}

class InitialBudgetSelectState extends BudgetSelectState {
  const InitialBudgetSelectState() : super(const []);
}

class DefaultBudgetSelected extends BudgetSelectState {
  const DefaultBudgetSelected({required this.budget}) : super(const []);

  final BudgetSummaryModel budget;
}

class ListBudgetSelection extends BudgetSelectState {
  const ListBudgetSelection(super.budgets);
}
