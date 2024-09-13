import 'package:pocketbase/pocketbase.dart';

Map<String, dynamic> modelToMap(RecordModel model) {
  return {
    ...model.data,
    'id': model.id,
    'created': model.created,
    'updated': model.updated,
  };
}
