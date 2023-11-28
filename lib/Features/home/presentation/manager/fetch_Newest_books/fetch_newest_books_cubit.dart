import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domin/entites/book_entite.dart';
import 'package:bookly/Features/home/domin/use_cases/fetched_newest_books.dart';
import 'package:meta/meta.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.fetchedNewestUsesCases) : super(FetchNewestBooksInitial());

  final FetchedNewestUsesCases fetchedNewestUsesCases;

    Future<void> fetchFeaturedBooks() async {
    emit(FetchNewestBooksLoading());

    var result = await fetchedNewestUsesCases.call();

    result.fold((faluier) => emit(FetchNewestBooksFaliure(faluier.errorMessage)),
        (books) {
      emit(FetchNewestBooksSuccess(books));
    });
  }
}
