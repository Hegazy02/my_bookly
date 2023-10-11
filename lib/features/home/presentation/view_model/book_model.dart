class BookModel {
  final String cover;
  final String title;
  final String authorName;
  final int price;
  final double rate;
  final int ratedTimes;
  final String description;
  BookModel({
    required this.cover,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rate,
    required this.ratedTimes,
    required this.description,
  });

  factory BookModel.fromMap({required Map data}) {
    return BookModel(
      cover: data['cover'],
      title: data['title'],
      authorName: data['authorName'],
      price: data['price'],
      rate: data['rate'],
      ratedTimes: data['ratedTimes'],
      description: data['description'],
    );
  }
}
