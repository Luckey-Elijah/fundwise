import 'package:app/util.dart';
import 'package:intl/intl.dart' as intl;
import 'package:pocketbase/pocketbase.dart';

class DateFormatStore {
  DateFormatStore({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;
  late final _collection = _pb.collection('date_formats');

  Future<List<DateFormat>> list() async {
    try {
      final records = await _collection.getList();
      return [
        ...records.items.map((record) => record.data).map(DateFormat.fromJson),
      ];
    } on ClientException {
      return [];
    }
  }

  Future<List<DateFormat>> search(String query) async {
    const cols = ['description', 'format'];
    try {
      final records = await _collection.getList(
        filter: cols.map((col) => '$col~"$query"').join('||'),
      );
      return [
        ...records.items.map((record) => record.data).map(DateFormat.fromJson),
      ];
    } on ClientException {
      return [];
    }
  }
}

class DateFormat {
  DateFormat({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.description,
    required this.pattern,
  });

  factory DateFormat.fromJson(Map<String, dynamic> map) {
    return DateFormat(
      id: map.tryString('id') ?? '',
      collectionId: map.tryString('collectionId') ?? '',
      collectionName: map.tryString('collectionName') ?? '',
      created: map.tryString('created') ?? '',
      updated: map.tryString('updated') ?? '',
      description: map.tryString('description') ?? '',
      pattern: map.tryString('format') ?? '',
    );
  }

  final String id;
  final String collectionId;
  final String collectionName;
  final String created;
  final String updated;
  final String description;
  final String pattern;
  String format(DateTime date) =>
      intl.DateFormat(pattern).format(DateTime.now());

  DateFormat copyWith({
    String? id,
    String? collectionId,
    String? collectionName,
    String? created,
    String? updated,
    String? description,
    String? format,
  }) {
    return DateFormat(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      description: description ?? this.description,
      pattern: format ?? pattern,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'updated': updated,
      'description': description,
      'format': pattern,
    };
  }
}
