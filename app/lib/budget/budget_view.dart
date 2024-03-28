import 'package:app/components/primary_header.dart';
import 'package:app/theme_extension/theme.dart';
import 'package:app/utility/build_context.extension.dart';
import 'package:app/utility/exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider<MonthCubit>(
          create: (_) => MonthCubit(),
          child: const _BudgetMonthHeader(),
        ),
        Expanded(
          child: ListView(
            children: [
              for (var i = 1; i <= 10; i++) ...[
                DecoratedBox(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Checkbox.adaptive(value: false, onChanged: (_) {}),
                        const Text('<budget item>'),
                        context.marginTheme.large.box,
                        const Flexible(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'assigned',
                            ),
                          ),
                        ),
                        const Text('<activity>'),
                        context.marginTheme.large.box,
                        const Text('<available>'),
                        context.marginTheme.large.box,
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _BudgetMonthHeader extends StatelessWidget {
  const _BudgetMonthHeader();

  @override
  Widget build(BuildContext context) {
    return PrimaryHeader(
      child: Row(
        children: [
          IconButton(
            onPressed: context.read<MonthCubit>().previous,
            icon: const Icon(Icons.arrow_left_rounded),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<MonthCubit, DateTime>(
                builder: (context, state) {
                  return TextButton(
                    onPressed: () => context.read<MonthCubit>().today(),
                    child: Text(
                      '${state.month.toString().padLeft(2, '0')}/${state.year}',
                      style: context.textTheme.bodyLarge,
                    ),
                  );
                },
              ),
              const _EnterNoteButton(),
            ],
          ),
          IconButton(
            onPressed: context.read<MonthCubit>().next,
            icon: const Icon(Icons.arrow_right_rounded),
          ),
        ],
      ),
    );
  }
}

class _EnterNoteButton extends StatefulWidget {
  const _EnterNoteButton();

  @override
  State<_EnterNoteButton> createState() => _EnterNoteButtonState();
}

class _EnterNoteButtonState extends State<_EnterNoteButton> {
  OverlayEntry? entry;
  final key = GlobalKey();

  (Offset, Size) getRect() {
    final box = key.currentContext?.findRenderObject();
    if (box is RenderBox) {
      return (box.localToGlobal(Offset.zero), box.size);
    }
    throw const FundwiseException(message: '[box] is not a [RenderBox]');
  }

  void toggleOverlay() {
    if (entry != null) {
      entry?.remove();
      entry?.dispose();
      entry = null;
      return;
    }
    final res = getRect();
    // final rect = res.$1 & res.$1;
    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: res.$1.dy,
          left: res.$1.dx,
          child: DecoratedBox(
            decoration: context.decorationTheme.primary.copyWith(
              color: Theme.of(context).colorScheme.tertiaryContainer,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context, debugRequiredFor: widget).insert(entry!);
  }

  @override
  void dispose() {
    entry?.remove();
    entry?.dispose();
    entry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: key,
      onPressed: toggleOverlay,
      style: TextButton.styleFrom(
        textStyle: context.textTheme.bodySmall,
      ),
      child: const Text('Enter a note...'),
    );
  }
}

class MonthCubit extends Cubit<DateTime> {
  MonthCubit() : super(DateTime.now());
  void next() => emit(DateTime(state.year, state.month + 1));
  void previous() => emit(DateTime(state.year, state.month - 1));
  void today() => emit(DateTime.now());
}
