import 'base_exception.dart';

/// Exception thrown when the request API dont have specify error.
class GeneralServerException extends ErrorException {
  const GeneralServerException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() => 'GeneralServerException'
      '(message: $message, code: $code, details: $details)';
}

/// Exception thrown when the request API having error time out.
class TimeOutServerException extends ErrorException {
  const TimeOutServerException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() => 'TimeOutServerException'
      '(message: $message, code: $code, details: $details)';
}

/// Exception thrown when the request API having error not found or [404] status code.
class NotFoundServerException extends ErrorException {
  const NotFoundServerException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() => 'NotFoundServerException'
      '(message: $message, code: $code, details: $details)';
}

/// Exception thrown when the request API having error does not have perrmision or [401] status code.
class UnAuthenticationServerException extends ErrorException {
  const UnAuthenticationServerException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() => 'UnAuthenticationServerException'
      '(message: $message, code: $code, details: $details)';
}

/// Exception thrown when the request API having error unauthorize or [403] status code.
class UnAuthorizeServerException extends ErrorException {
  const UnAuthorizeServerException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() => 'UnAuthorizeServerException'
      '(message: $message, code: $code, details: $details)';
}

/// Exception thrown when the request API having error from server or around [500]-[599] status code.
class InternalServerException extends ErrorException {
  const InternalServerException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() => 'InternalServerException'
      '(message: $message, code: $code, details: $details)';
}
