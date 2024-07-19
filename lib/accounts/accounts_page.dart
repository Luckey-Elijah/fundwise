import 'dart:math';

import 'package:app/budget/ui/budget_page.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountsBloc(),
      child: BlocBuilder<AccountsBloc, AccountsState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.accounts.length,
            itemBuilder: (_, i) {
              return AccountSummaryTile(
                name: state.accounts[i].name,
                cleared: state.accounts[i].cleared,
                uncleared: state.accounts[i].uncleared,
                type: state.accounts[i].type,
              );
            },
          );
        },
      ),
    );
  }
}

class AccountSummaryTile extends StatelessWidget {
  const AccountSummaryTile({
    required this.name,
    required this.cleared,
    required this.uncleared,
    required this.type,
    super.key,
  });

  final String name;
  final String cleared;
  final String uncleared;
  final AccountType type;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: context.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name.toUpperCase(),
                  style: context.h2.wide.thin.xl,
                ),
                const GutterLarge(),
                Text(
                  switch (type) {
                    AccountType.savings => 'Savings',
                    AccountType.checking => 'Checking',
                  },
                  style: context.p.thin.secondary.lg,
                ),
              ],
            ),
            const Gutter(),
            Row(
              children: [
                Row(
                  children: [
                    CustomPaint(
                      painter: ClearedBalanceIconPainter(cleared: true),
                      size: const Size.square(20),
                    ),
                    const GutterTiny(),
                    Text(cleared),
                  ],
                ),
                const GutterLarge(),
                Row(
                  children: [
                    CustomPaint(
                      painter: ClearedBalanceIconPainter(cleared: false),
                      size: const Size.square(20),
                    ),
                    const GutterTiny(),
                    Text(uncleared),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc() : super(AccountsState()) {
    on<AccountsEvent>((event, emit) {});
  }
}

class AccountsState {
  final accounts = [
    for (var i = 0; i < 10; i++)
      Account(
        name: 'Account $i',
        cleared: r(),
        uncleared: r(),
        type: AccountType.savings,
      ),
  ];
}

class Account {
  const Account({
    required this.name,
    required this.cleared,
    required this.uncleared,
    required this.type,
  });

  final String name;
  final String cleared;
  final String uncleared;
  final AccountType type;
}

enum AccountType {
  savings,
  checking,
}

class AccountsEvent {}

class ClearedBalanceIconPainter extends CustomPainter {
  ClearedBalanceIconPainter({required this.cleared});

  final bool cleared;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.5
      ..color = Colors.black
      ..style = cleared ? PaintingStyle.fill : PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );
    if (cleared) {
      paint
        ..color = Colors.white
        ..style = PaintingStyle.stroke;
    }
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width / 2,
        height: size.height / 2,
      ),
      -7 * pi / 4,
      3 * pi / 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant ClearedBalanceIconPainter oldDelegate) {
    return oldDelegate.cleared != cleared;
  }
}
