import 'package:app/repository/date_format_store.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';

class BudgetNewPage extends StatelessWidget {
  const BudgetNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () => context.go('/budget'),
                label: const Text('Back'),
                icon: const Icon(Icons.chevron_left),
              ),
              Text(
                'New Budget',
                style: context.h3,
              ),
              const Gutter(),
              Expanded(
                child: ListView(
                  children: [
                    const FormRow(label: 'Budget Name', child: TextField()),
                    FormRow(
                      label: 'Date Format',
                      child: BlocProvider(
                        create: (context) =>
                            DateFormatPickerCubit(repo: dateFormat$)
                              ..initialize(),
                        child: const DateFormatPicker(),
                      ),
                    ),
                    const FormRow(label: 'currency format', child: TextField()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
          Expanded(child: Text(label)),
          Expanded(
            flex: 3,
            child: child,
          ),
        ],
      ),
    );
  }
}

final today = DateTime.now();

class DateFormatPicker extends StatelessWidget {
  const DateFormatPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<DateFormat>(
      iconSize: 0,
      value:
          context.select((DateFormatPickerCubit cubit) => cubit.state.selected),
      items: [
        ...context.select(
          (DateFormatPickerCubit cubit) => cubit.state.dateFormats.map(
            (fmt) => DropdownMenuItem(
              value: fmt,
              child: Text(fmt.format(today)),
            ),
          ),
        ),
      ],
      onChanged: context.read<DateFormatPickerCubit>().select,
    );
  }
}

class DateFormatPickerCubitState {
  const DateFormatPickerCubitState({
    required this.dateFormats,
    required this.selected,
  });

  final List<DateFormat> dateFormats;
  final DateFormat? selected;
}

class DateFormatPickerCubit extends Cubit<DateFormatPickerCubitState> {
  DateFormatPickerCubit({required this.repo})
      : super(
          const DateFormatPickerCubitState(
            dateFormats: [],
            selected: null,
          ),
        );

  final DateFormatStore repo;

  Future<void> initialize() async {
    final dateFormats = await repo.list();
    emit(
      DateFormatPickerCubitState(
        dateFormats: dateFormats,
        selected: dateFormats.firstOrNull,
      ),
    );
  }

  void select(DateFormat? selected) {
    emit(
      DateFormatPickerCubitState(
        dateFormats: state.dateFormats,
        selected: selected,
      ),
    );
  }
}
