import 'package:flutter/material.dart';
import '../Performance Optimized Image Widget.dart';
import '../Responsive Utilities/ResponsiveUtil.dart';
import '../models/tour_package.dart';


class TourPackageCard extends StatelessWidget {
  final TourPackage tourPackage;
  final VoidCallback onTap;

  const TourPackageCard({
    Key? key,
    required this.tourPackage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Adapt card height based on screen size
    final cardHeight = ResponsiveUtil.isSmallPhone() ? 100.0 : 120.0;
    final imageWidth = ResponsiveUtil.isSmallPhone() ? 100.0 : 120.0;
    final fontSize = ResponsiveUtil.isSmallPhone() ? 0.9 : 1.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Tour image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: OptimizedNetworkImage(
                imageUrl: tourPackage.image,
                width: imageWidth,
                height: cardHeight,
                fit: BoxFit.cover,
              ),
            ),

            // Tour details
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16 * fontSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Name
                    Text(
                      tourPackage.name,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16 * fontSize,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 4 * fontSize),

                    // Duration
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 14 * fontSize,
                        ),
                        SizedBox(width: 4 * fontSize),
                        Text(
                          tourPackage.duration,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12 * fontSize,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 4 * fontSize),

                    // Rating
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: const Color(0xFFFFD700),
                          size: 14 * fontSize,
                        ),
                        SizedBox(width: 4 * fontSize),
                        Text(
                          '${tourPackage.rating} (${tourPackage.reviewCount})',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12 * fontSize,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 4 * fontSize),

                    // Price
                    Row(
                      children: [
                        if (tourPackage.discountPercentage > 0) ...[
                          Text(
                            '\$${tourPackage.price.toInt()}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14 * fontSize,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 8 * fontSize),
                        ],
                        Text(
                          '\$${tourPackage.discountedPrice.toInt()}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16 * fontSize,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Favorite button
            Padding(
              padding: EdgeInsets.all(16 * fontSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    tourPackage.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: tourPackage.isFavorite ? Colors.red : Colors.grey,
                    size: 24 * fontSize,
                  ),
                  if (tourPackage.discountPercentage > 0)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8 * fontSize,
                        vertical: 4 * fontSize,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '-${tourPackage.discountPercentage}%',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12 * fontSize,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}