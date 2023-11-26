import 'package:bookly/Features/home/domin/entites/book_entite.dart';
import 'package:bookly/core/errors/faluier.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Faluier, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Faluier, List<BookEntity>>> fetchNewstBooks();
}
