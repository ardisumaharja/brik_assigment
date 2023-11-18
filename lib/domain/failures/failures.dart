// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure {}

class CacheFailure extends Failure with EquatableMixin {
  final String? stackTrace;

  CacheFailure({
    this.stackTrace,
  });

  @override
  List<Object?> get props => [stackTrace];
}
