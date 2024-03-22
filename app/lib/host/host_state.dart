import 'package:dart_mappable/dart_mappable.dart';

part 'host_state.mapper.dart';

@MappableClass()
class HostState with HostStateMappable {
  const HostState({required this.status, this.url, this.maybeUrl});
  final Uri? url;
  final String? maybeUrl;
  final HostStatus status;
}

enum HostStatus { loaded, loading, success, error }
