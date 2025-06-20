import 'package:dart_mappable/dart_mappable.dart' as mappable;
import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart' as pb;

mixin CollectionModel {
  String get id;
  DateTime get created;
  DateTime get updated;
}

class Collection<T extends CollectionModel> {
  const Collection(
    this.collection, {
    required this.mapper,
    this.expand = const <String>[],
    this.query = const <String, dynamic>{},
  });

  final pb.RecordService collection;
  final mappable.ClassMapperBase<T> mapper;
  final List<String> expand;
  final Map<String, dynamic> query;

  Map<String, dynamic> _query(Map<String, dynamic>? other) => {...query, ...?other};

  Future<T> create(
    T object, {
    List<String> removeKeys = const ['id', 'created', 'updated'],
    Map<String, dynamic>? query,
    List<http.MultipartFile> files = const [],
    Map<String, String> headers = const {},
    String? expand,
    String? fields,
  }) async {
    final body = mapper.encodeMap(object);
    removeKeys.forEach(body.remove);
    final model = await collection.create(
      body: body,
      expand: expand ?? this.expand.join(','),
      fields: fields,
      files: files,
      headers: headers,
      query: _query(query),
    );

    return mapper.decodeMap<T>(_recordModelToMap(model));
  }

  Future<void> delete(
    String id, {
    Map<String, dynamic> body = const {},
    Map<String, dynamic>? query,
    Map<String, String> headers = const {},
  }) async {
    await collection.delete(id, body: body, query: _query(query), headers: headers);
  }

  Future<T> getFirstListItem(
    String filter, {
    String? expand,
    String? fields,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    final model = await collection.getFirstListItem(
      filter,
      expand: expand ?? this.expand.join(','),
      fields: fields,
      query: _query(query),
      headers: headers,
    );

    return mapper.decodeMap<T>(_recordModelToMap(model));
  }

  Future<List<T>> getFullList({
    int batch = 500,
    String? expand,
    String? filter,
    String? sort,
    String? fields,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    final results = await collection.getFullList(
      batch: batch,
      expand: expand ?? this.expand.join(','),
      filter: filter,
      sort: sort,
      fields: fields,
      query: _query(query),
      headers: headers,
    );
    return [...results.map(_recordModelToMap).map(mapper.decodeMap)];
  }

  Future<CollectionResultList<T>> getList({
    int page = 1,
    int perPage = 30,
    bool skipTotal = false,
    String? expand,
    String? filter,
    String? sort,
    String? fields,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    final results = await collection.getList(
      page: page,
      perPage: perPage,
      skipTotal: skipTotal,
      expand: expand ?? this.expand.join(','),
      filter: filter,
      sort: sort,
      fields: fields,
      query: _query(query),
      headers: headers,
    );
    final items = results.items.map(_recordModelToMap).map(mapper.decodeValue<T>);
    return CollectionResultList(
      items: [...items],
      page: results.page,
      perPage: results.perPage,
      totalItems: results.totalItems,
      totalPages: results.totalPages,
    );
  }

  Future<T> getOne(
    String id, {
    String? expand,
    String? fields,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    final model = await collection.getOne(
      id,
      expand: expand ?? this.expand.join(','),
      fields: fields,
      query: _query(query),
      headers: headers,
    );

    final map = _recordModelToMap(model);
    final data = mapper.decodeMap<T>(map);
    return data;
  }

  Future<T> update(
    String id, {
    Map<String, dynamic> body = const {},
    Map<String, dynamic> query = const {},
    List<http.MultipartFile> files = const [],
    Map<String, String> headers = const {},
    String? expand,
    String? fields,
  }) async {
    final model = await collection.update(
      id,
      body: body,
      query: _query(query),
      files: files,
      expand: expand ?? this.expand.join(','),
      fields: fields,
      headers: headers,
    );

    return mapper.decodeMap<T>(_recordModelToMap(model));
  }

  Map<String, dynamic> _recordModelToMap(pb.RecordModel model) => {
    ...model.flattened,
    'id': model.id,
  };
}

extension CollectionBuilder on pb.RecordService {
  Collection<T> toCollection<T extends CollectionModel>(
    mappable.ClassMapperBase<T> mapper, {
    List<String> expand = const <String>[],
  }) {
    return Collection<T>(this, mapper: mapper, expand: expand);
  }
}

extension on pb.RecordModel {
  Map<String, dynamic> get expand$ {
    if (data case {'expand': final Map<String, dynamic> expand}) {
      return expand;
    }
    return {};
  }

  Map<String, dynamic> get flattened => {...data, ...expand$};
}

class CollectionResultList<T extends CollectionModel> {
  CollectionResultList({
    required this.items,
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
  });

  final List<T> items;
  final int page;
  final int perPage;
  final int totalItems;
  final int totalPages;
}
