class CardModel {
  final String img;
  final String title;
  final String price;
  final bool isAksiya;
  bool isFavorite;

  CardModel({
    required this.img,
    required this.title,
    required this.price,
    required this.isAksiya,
    required this.isFavorite
  });
}
