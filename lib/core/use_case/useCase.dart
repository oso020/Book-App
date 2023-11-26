
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/faluier.dart';

abstract class UseCase<type> {
  Future<Either<Faluier, type>> call();
}
