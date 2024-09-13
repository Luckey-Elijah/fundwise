import 'dart:async';

import 'package:app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BudgetSelectEvent {}

class InitializeBudgetSelectEvent extends BudgetSelectEvent {}

class SelectBudgetEvent extends BudgetSelectEvent {
  SelectBudgetEvent(this.budget);

  final BudgetSummaryModel budget;
}

class BudgetSelectBloc extends Bloc<BudgetSelectEvent, BudgetSelectState> {
  BudgetSelectBloc(this._budgetStore$)
      : super(const InitialBudgetSelectState()) {
    on<InitializeBudgetSelectEvent>(_onInitializeBudgetSelectEvent);
    on<SelectBudgetEvent>(_onSelectBudgetEvent);
  }

  final BudgetRepository _budgetStore$;

  Future<void> _onInitializeBudgetSelectEvent(
    InitializeBudgetSelectEvent event,
    Emitter<BudgetSelectState> emit,
  ) async {
    final defaultBudget = await _budgetStore$.getDefaultBudget();
    if (defaultBudget != null) {
      return emit(DefaultBudgetSelected(budget: defaultBudget));
    }

    try {
      final budgets = await _budgetStore$.getBudgets();
      emit(ListBudgetSelection(budgets));
    } on Exception {
      emit(const ErrorBudgetSelection());
    }
  }

  Future<void> _onSelectBudgetEvent(
    SelectBudgetEvent event,
    Emitter<BudgetSelectState> emit,
  ) async {
    await _budgetStore$.setDefault(event.budget);
    return emit(DefaultBudgetSelected(budget: event.budget));
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

class ErrorBudgetSelection extends BudgetSelectState {
  const ErrorBudgetSelection() : super(const []);
}
