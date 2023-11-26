  import 'package:bookly/Features/home/domin/entites/book_entite.dart';
import 'package:hive/hive.dart';

void saveBooksDataLocal(List<BookEntity> books,String booksName) {
     var bookData = Hive.box(booksName);
    bookData.addAll(books);
  }