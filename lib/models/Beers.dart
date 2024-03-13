class Beers {
  final String? name;
  final String? abv;
  final String? image;
  final String? price;

  Beers({
    required this.name,
    required this.abv,
    required this.image,
    required this.price,
  });

  factory Beers.fromJson(Map<String, dynamic> json) {
    return Beers(
      name: json['name'] ?? '',
      abv: json['abv'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? '',
    );
  }
}
