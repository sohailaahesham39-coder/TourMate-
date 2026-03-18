class TourPackage {
  final String id;
  final String name;
  final String image;
  final double rating;
  final int reviewCount;
  final String duration;
  final double price;
  final int discountPercentage;
  final bool isFavorite;

  TourPackage({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.duration,
    required this.price,
    required this.discountPercentage,
    this.isFavorite = false,
  });

  double get discountedPrice {
    return price - (price * discountPercentage / 100);
  }

  TourPackage copyWith({
    String? id,
    String? name,
    String? image,
    double? rating,
    int? reviewCount,
    String? duration,
    double? price,
    int? discountPercentage,
    bool? isFavorite,
  }) {
    return TourPackage(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}