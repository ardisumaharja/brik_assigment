import 'base_exception.dart';

/// Exception thrown when the request local data processing dont have specify error.
class GeneralCacheException extends ErrorException {
  const GeneralCacheException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() =>
      'CacheException(message: $message, code: $code, details: $details)';
}

/// Thrown when cache is empty or not found
class NotFoundCacheException extends ErrorException {
  const NotFoundCacheException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() => 'NotFoundCacheException'
      '(message: $message, code: $code, details: $details)';
}

/// Throw when cache is expired
class ExpiredCacheException extends ErrorException {
  const ExpiredCacheException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() => 'ExpiredCacheException'
      '(message: $message, code: $code, details: $details)';
}
