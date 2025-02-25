import 'package:duck_router/duck_router.dart';
import 'package:fundwise/reports/reports_page.dart';

class ReportsLocation extends Location {
  @override
  LocationBuilder? get builder => (_) => ReportsPage();

  @override
  String get path => 'reports/';
}
