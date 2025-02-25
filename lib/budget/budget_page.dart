import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TableExample();
  }
}

class TableExample extends StatefulWidget {
  const TableExample({super.key});

  @override
  State<TableExample> createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample> {
  final horizontalScrollController = ScrollController();

  @override
  void dispose() {
    horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const invoices = [
      ['INV001', 'Paid', 'Credit Card', r'$250.00'],
      ['INV002', 'Pending', 'PayPal', r'$150.00'],
      ['INV003', 'Unpaid', 'Bank Transfer', r'$350.00'],
      ['INV004', 'Paid', 'Credit Card', r'$450.00'],
      ['INV005', 'Paid', 'PayPal', r'$550.00'],
      ['INV006', 'Pending', 'Bank Transfer', r'$200.00'],
      ['INV007', 'Unpaid', 'Credit Card', r'$300.00'],
    ];
    final headings = ['CATEGORY', 'ASSIGNED', 'ACTIVITY', 'AVAILABLE'];
    return ShadTable(
      horizontalScrollController: horizontalScrollController,
      columnCount: invoices[0].length,
      rowCount: invoices.length,
      header: (context, column) {
        final isLast = column == headings.length - 1;
        return ShadTableCell.header(
          padding: EdgeInsets.zero,
          alignment: isLast ? Alignment.centerRight : null,
          child: ShadButton.link(
            padding: EdgeInsets.zero,
            child: Text(headings[column]),
          ),
        );
      },
      rowSpanExtent: (row) => FixedSpanExtent(40),
      columnSpanExtent: (index) {
        return switch (index) {
          0 => FractionalSpanExtent(3 / 8),
          _ => MaxSpanExtent(
            FractionalSpanExtent(5 / 24),
            FixedSpanExtent(110),
          ),
        };
      },
      builder: (context, index) {
        final invoice = invoices[index.row];
        return ShadTableCell(
          alignment:
              index.column == invoice.length - 1
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
          padding: EdgeInsets.zero,
          child: ShadButton.link(
            padding: EdgeInsets.zero,
            child: Text(invoice[index.column]),
          ),
        );
      },
      footer: (context, column) {
        if (column == 0) {
          return const ShadTableCell.footer(
            child: Text('Total', style: TextStyle(fontWeight: FontWeight.w500)),
          );
        }
        if (column == 3) {
          return const ShadTableCell.footer(
            alignment: Alignment.centerRight,
            child: Text(r'$2500.00'),
          );
        }
        return const ShadTableCell(child: SizedBox());
      },
    );
  }
}
