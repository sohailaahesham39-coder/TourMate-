import 'package:flutter/material.dart';
import 'App Configuration.dart';

/// A performance-optimized image widget that handles image loading efficiently
/// and provides proper fallbacks for error states.
class OptimizedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final bool isListing;
  final Widget? placeholder;
  final Widget? errorWidget;

  const OptimizedNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.isListing = true,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final optimizedUrl = AppConfig.getOptimizedImageUrl(imageUrl, isListing: isListing);

    return Image.network(
      optimizedUrl,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return placeholder ?? Container(
          width: width,
          height: height,
          color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
          child: Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
                strokeWidth: 2,
                color: isDarkMode ? Colors.white70 : Colors.black54,
              ),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ?? Container(
          width: width,
          height: height,
          color: isDarkMode ? Colors.grey[800] : Colors.grey[300],
          child: Center(
            child: Icon(
              Icons.image_not_supported,
              color: isDarkMode ? Colors.white54 : Colors.grey,
              size: width > 100 ? 40 : 24,
            ),
          ),
        );
      },
      // Set cacheWidth for memory optimization
      cacheWidth: AppConfig.isLowEndDevice
          ? AppConfig.lowResImageWidth
          : isListing
          ? AppConfig.mediumResImageWidth
          : null,
      // Additional network image configurations
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: child,
        );
      },
    );
  }
}