import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domin/entites/book_entite.dart';
import 'package:bookly/Features/home/domin/use_cases/fetched_Featuredbooks_uses_cases.dart';
import 'package:bookly/core/errors/faluier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchedFeaturedUsesCases)
      : super(FeaturedBooksInitial());

  final FetchedFeaturedUsesCases fetchedFeaturedUsesCases;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await fetchedFeaturedUsesCases.call();

    result.fold((faluier) => emit(FeaturedBooksFailure(faluier.errorMessage)),
        (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
