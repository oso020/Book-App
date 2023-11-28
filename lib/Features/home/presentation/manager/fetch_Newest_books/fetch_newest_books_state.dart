part of 'fetch_newest_books_cubit.dart';

@immutable
class FetchNewestBooksState {}

class FetchNewestBooksInitial extends FetchNewestBooksState {}

class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookEntity> books;

  FetchNewestBooksSuccess(this.books);
}

class FetchNewestBooksLoading extends FetchNewestBooksState {}

class FetchNewestBooksFaliure extends FetchNewestBooksState {
  final String errorMessage;

  FetchNewestBooksFaliure(this.errorMessage);
}
