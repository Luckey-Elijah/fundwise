import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  BudgetBloc() : super(BudgetState()) {
    on<BudgetEvent>((event, emit) {});
  }
}

class BudgetState {}

class BudgetEvent {}
