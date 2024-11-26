import '../../domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required super.id,
    required super.title,
    required super.description,
    required super.publishedDate,
    required super.coverPictureURL,
    required super.price,
    required super.starCount,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      publishedDate: DateTime.parse(json['publishedDate']),
      coverPictureURL: json['coverPictureURL'],
      price: json['price'],
      starCount: json['starCount'],
    );
  }
}
