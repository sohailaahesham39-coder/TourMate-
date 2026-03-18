import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A class that holds application-wide configurations and settings
class AppConfig {
  // App metadata
  static const String appName = 'Tour Mate';
  static const String appVersion = '1.0.0';

  // Performance settings
  static const bool enablePerformanceLogging = false;
  static const int cacheMaxAge = 2 * 24 * 60 * 60 * 1000; // 2 days in milliseconds

  // Network settings
  static const Duration timeoutDuration = Duration(seconds: 30);
  static const int maxConcurrentNetworkRequests = 3;

  // Image optimization
  static const int lowResImageWidth = 200;
  static const int mediumResImageWidth = 500;
  static const int highResImageWidth = 1200;

  // Device-specific settings
  static bool isLowEndDevice = false;

  // Initialize app configuration based on device capabilities
  static Future<void> init() async {
    // Set up system UI
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    // Enable portrait orientation only
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Detect if device is low-end based on available memory
    // This is a simple approximation and may not work on all devices
    try {
      final deviceInfo = await _getDeviceInfo();
      isLowEndDevice = deviceInfo.containsKey('lowMem') && deviceInfo['lowMem'] == true;
    } catch (e) {
      // If there's an error, assume it's not a low-end device
      isLowEndDevice = false;
    }
  }

  // A placeholder for device info implementation
  // You would integrate a package like device_info_plus here
  static Future<Map<String, dynamic>> _getDeviceInfo() async {
    // Return mock data for now
    return {'lowMem': false};
  }

  // Get the appropriate image quality based on device capabilities
  static String getOptimizedImageUrl(String originalUrl, {bool isListing = true}) {
    if (isLowEndDevice) {
      return _appendToImageUrl(originalUrl, 'w=${lowResImageWidth}');
    } else {
      final targetWidth = isListing ? mediumResImageWidth : highResImageWidth;
      return _appendToImageUrl(originalUrl, 'w=${targetWidth}');
    }
  }

  // Helper to append query parameters to image URLs
  static String _appendToImageUrl(String url, String parameter) {
    // Only append to URLs that support this (like unsplash)
    if (url.contains('unsplash.com')) {
      if (url.contains('?')) {
        return '$url&$parameter';
      } else {
        return '$url?$parameter';
      }
    }
    return url;
  }
}