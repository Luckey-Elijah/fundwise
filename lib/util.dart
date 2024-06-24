extension JsonExtension on Map<String, dynamic> {
  T? tryNum<T extends num>(String key) {
    final value = this[key];
    if (value is T) return value;
    return null;
  }

  double? tryDouble(String key) => tryNum<double>(key);

  int? tryInt(String key) => tryNum<int>(key);

  String? tryString(String key) {
    final value = this[key];
    if (value is String) return value;
    return null;
  }

  bool? tryBool(String key) {
    final value = this[key];
    if (value is bool) return value;
    if (value is String) return bool.tryParse(value);
    return null;
  }

  List<T>? tryList<T>(String key) {
    final value = this[key];
    if (value is List<T>) return value;
    if (value is List) {
      return List<T>.of(value.cast<T>());
    }
    return null;
  }
}
