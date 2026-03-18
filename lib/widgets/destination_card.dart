import 'package:flutter/material.dart';
import '../Performance Optimized Image Widget.dart';
import '../Responsive Utilities/ResponsiveUtil.dart';
import '../models/destination.dart';


class DestinationCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback onTap;

  const DestinationCard({
    Key? key,
    required this.destination,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Adapt card width based on screen size
    final cardWidth = ResponsiveUtil.isSmallPhone() ? 180.0 : 220.0;
    final imageHeight = ResponsiveUtil.isSmallPhone() ? 140.0 : 160.0;
    final fontSize = ResponsiveUtil.isSmallPhone() ? 0.9 : 1.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Destination image
            Stack(
              children: [
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: OptimizedNetworkImage(
                    imageUrl: destination.image,
                    width: cardWidth,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                ),

                // Favorite button
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      destination.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: destination.isFavorite
                          ? Colors.red
                          : Colors.grey,
                      size: 20,
                    ),
                  ),
                ),

                // Price tag
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12 * fontSize,
                      vertical: 6 * fontSize,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '\$${destination.price.toInt()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14 * fontSize,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Destination details
            Padding(
              padding: EdgeInsets.all(16 * fontSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    destination.name,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * fontSize,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 4 * fontSize),

                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 14 * fontSize,
                      ),
                      SizedBox(width: 4 * fontSize),
                      Expanded(
                        child: Text(
                          destination.location,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12 * fontSize,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8 * fontSize),

                  // Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: const Color(0xFFFFD700),
                        size: 16 * fontSize,
                      ),
                      SizedBox(width: 4 * fontSize),
                      Text(
                        destination.rating.toString(),
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14 * fontSize,
                        ),
                      ),
                      SizedBox(width: 4 * fontSize),
                      Text(
                        '(${destination.reviewCount})',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12 * fontSize,
                        ),
                      ),
                    ],
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