class Book {
  final dynamic id;
  final dynamic title;
  final dynamic description;
  final DateTime publishedDate;
  final dynamic coverPictureURL;
  final dynamic price;
  final dynamic starCount;

  const Book({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedDate,
    required this.coverPictureURL,
    required this.price,
    required this.starCount,
  });
}
