import 'package:hive/hive.dart';
part 'book_entite.g.dart';
@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? author;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final num? rate;

  BookEntity(
      {required this.image,
      required this.title,
      required this.author,
      required this.price,
      required this.rate});
}
