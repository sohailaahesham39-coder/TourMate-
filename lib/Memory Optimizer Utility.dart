import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'App Configuration.dart';

/// A utility class that provides methods to optimize memory usage
/// especially for low-end devices like OL phones.
class MemoryOptimizer {
  // Cache to hold weak references to images
  static final Map<String, ImageProvider> _imageCache = {};

  // Maximum number of images to keep in memory
  static const int _maxCachedImages = 20;

  // Image cache size in bytes (15MB for low-end devices, 50MB for higher-end)
  static int get _imageCacheSizeBytes =>
      AppConfig.isLowEndDevice ? 15 * 1024 * 1024 : 50 * 1024 * 1024;

  /// Initialize the memory optimizer
  static void init() {
    // Set image cache size based on device capability
    PaintingBinding.instance.imageCache.maximumSizeBytes = _imageCacheSizeBytes;

    // Reduce the number of cached images for low-end devices
    if (AppConfig.isLowEndDevice) {
      PaintingBinding.instance.imageCache.maximumSize = 50; // Default is 1000
    }
  }

  /// Clear image cache when app goes to background
  static void clearImageCacheOnBackground() {
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
    _imageCache.clear();
  }

  /// Get an optimized image provider that considers device capabilities
  static ImageProvider getOptimizedImageProvider(String url) {
    if (_imageCache.containsKey(url)) {
      return _imageCache[url]!;
    }

    final optimizedUrl = AppConfig.getOptimizedImageUrl(url);
    final provider = NetworkImage(optimizedUrl);

    // Manage cache size
    if (_imageCache.length > _maxCachedImages) {
      _imageCache.remove(_imageCache.keys.first);
    }

    _imageCache[url] = provider;
    return provider;
  }
}
