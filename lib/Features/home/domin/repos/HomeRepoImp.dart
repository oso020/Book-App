import 'package:bookly/Features/home/data/data_source/homeRemoteDatasource.dart';
import 'package:bookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/domin/entites/book_entite.dart';
import 'package:bookly/Features/home/domin/repos/HomeReps.dart';
import 'package:bookly/core/errors/faluier.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteSourceImpl homeRemoteSourceImpl;
  final HomeLocalDataSourceImpl homeLocalDataSourceImpl;

  HomeRepoImpl(
      {required this.homeRemoteSourceImpl,
      required this.homeLocalDataSourceImpl});

  @override
  Future<Either<Faluier, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var booksList =  homeLocalDataSourceImpl.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteSourceImpl.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Faluier());
    }
  }

  @override
  Future<Either<Faluier, List<BookEntity>>> fetchNewstBooks() async{
     try {
      var booksList =  homeLocalDataSourceImpl.fetchNewestBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteSourceImpl.fetchNewstBooks();
      return right(books);
    } catch (e) {
      return left(Faluier());
    }
  }
}
