import 'package:dart_frog/dart_frog.dart';
import 'package:fundwise_database/database.dart';

extension RequestContextExtension on RequestContext {
  FundwiseDatabase get database => read<FundwiseDatabase>();
}
