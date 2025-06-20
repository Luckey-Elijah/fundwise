import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ReportsPage extends ConsumerWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomPaint(size: Size.square(100));
    // return Align(alignment: AlignmentDirectional.bottomCenter, child: ShadProgress());
  }
}
