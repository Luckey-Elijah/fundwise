import 'package:app/reports/reports_page.dart';
import 'package:duck_router/duck_router.dart';

class ReportsLocation extends Location {
  @override
  LocationBuilder? get builder => (_) => ReportsPage();

  @override
  String get path => 'reports/';
}
