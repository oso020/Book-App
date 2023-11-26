import 'package:bookly/Features/home/domin/entites/book_entite.dart';
import 'package:bookly/Features/home/domin/repos/HomeReps.dart';
import 'package:bookly/core/errors/faluier.dart';
import 'package:bookly/core/use_case/useCaseParameter.dart';
import 'package:dartz/dartz.dart';

class FetchedFeaturedUsesCases extends UseCaseParameter<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchedFeaturedUsesCases(this.homeRepo);

  @override
  Future<Either<Faluier, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
