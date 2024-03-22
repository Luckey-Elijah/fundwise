import 'package:dart_mappable/dart_mappable.dart';

part 'exception.mapper.dart';

@MappableClass()
class FundwiseException with FundwiseExceptionMappable implements Exception {
  const FundwiseException({
    this.error,
    this.message,
  });

  final Object? error;
  final Object? message;
}
