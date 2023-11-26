import 'package:bookly/core/errors/faluier.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseParameter<type, Param> {
  Future<Either<Faluier, type>> call([Param param]);
}

class NoParam {}
