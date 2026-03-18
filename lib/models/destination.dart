class Destination {
  final String id;
  final String name;
  final String image;
  final double rating;
  final int reviewCount;
  final String description;
  final double price;
  final String location;
  final String category;
  final bool isFavorite;

  Destination({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.price,
    required this.location,
    required this.category,
    this.isFavorite = false,
  });

  Destination copyWith({
    String? id,
    String? name,
    String? image,
    double? rating,
    int? reviewCount,
    String? description,
    double? price,
    String? location,
    String? category,
    bool? isFavorite,
  }) {
    return Destination(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      description: description ?? this.description,
      price: price ?? this.price,
      location: location ?? this.location,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}