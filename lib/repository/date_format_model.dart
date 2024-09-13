import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart' as intl;

part 'date_format_model.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class DateFormatModel with DateFormatModelMappable {
  DateFormatModel({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.description,
    required this.pattern,
  });

  final String id;
  final String collectionId;
  final String collectionName;
  final String created;
  final String updated;
  final String description;
  final String pattern;
  String format(DateTime date) =>
      intl.DateFormat(pattern).format(DateTime.now());
}
