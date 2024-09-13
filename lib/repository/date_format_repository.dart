import 'package:app/repository/date_format_model.dart';
import 'package:app/repository/model_to_map.dart';
import 'package:pocketbase/pocketbase.dart';

class DateFormatRepository {
  DateFormatRepository({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;
  late final _collection = _pb.collection('date_formats');

  Future<List<DateFormatModel>> list() async {
    try {
      final records = await _collection.getList();
      return records.items
          .map(modelToMap)
          .map(DateFormatModelMapper.fromMap)
          .toList();
    } on ClientException {
      return [];
    }
  }

  Future<List<DateFormatModel>> search(String query) async {
    const cols = ['description', 'format'];
    try {
      final records = await _collection.getList(
        filter: cols.map((col) => '$col~"$query"').join('||'),
      );

      return records.items
          .map(modelToMap)
          .map(DateFormatModelMapper.fromMap)
          .toList();
    } on ClientException {
      return [];
    }
  }
}
