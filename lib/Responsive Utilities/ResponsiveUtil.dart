import 'package:flutter/material.dart';

/// A utility class that provides responsive sizing and scaling functions
/// to ensure UI consistency across different device sizes.
class ResponsiveUtil {
  static MediaQueryData? _mediaQueryData;
  static double get screenWidth => _mediaQueryData?.size.width ?? 375.0; // Default fallback value
  static double get screenHeight => _mediaQueryData?.size.height ?? 812.0; // Default fallback value
  static double get defaultSize => orientation == Orientation.landscape
      ? screenHeight * 0.024
      : screenWidth * 0.024;
  static Orientation get orientation => _mediaQueryData?.orientation ?? Orientation.portrait;
  static double get safeAreaHorizontal => (_mediaQueryData?.padding.left ?? 0) + (_mediaQueryData?.padding.right ?? 0);
  static double get safeAreaVertical => (_mediaQueryData?.padding.top ?? 0) + (_mediaQueryData?.padding.bottom ?? 0);
  static double get safeBlockHorizontal => (screenWidth - safeAreaHorizontal) / 100;
  static double get safeBlockVertical => (screenHeight - safeAreaVertical) / 100;

  // Initialize responsive values based on screen size
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }

  // Get responsive width based on percentage of screen width
  static double widthPercent(double percent) {
    return safeBlockHorizontal * percent;
  }

  // Get responsive height based on percentage of screen height
  static double heightPercent(double percent) {
    return safeBlockVertical * percent;
  }

  // Get adaptive size based on the device's width
  static double adaptiveSize(double size) {
    return size * defaultSize;
  }

  // Get font size that adapts to the screen size
  static double fontSize(double size) {
    return adaptiveSize(size);
  }

  // Check if the device is a small phone (width less than 360)
  static bool isSmallPhone() {
    return screenWidth < 360;
  }

  // Check if the device is a medium phone (width between 360 and 400)
  static bool isMediumPhone() {
    return screenWidth >= 360 && screenWidth < 400;
  }

  // Check if the device is a large phone (width greater than 400)
  static bool isLargePhone() {
    return screenWidth >= 400;
  }

  // Get adaptive padding based on screen size
  static EdgeInsets getAdaptivePadding({
    double horizontal = 16,
    double vertical = 16,
  }) {
    if (isSmallPhone()) {
      return EdgeInsets.symmetric(
        horizontal: horizontal * 0.8,
        vertical: vertical * 0.8,
      );
    } else if (isMediumPhone()) {
      return EdgeInsets.symmetric(
        horizontal: horizontal * 0.9,
        vertical: vertical * 0.9,
      );
    } else {
      return EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      );
    }
  }

  // Get adaptive spacing based on screen size
  static double getAdaptiveSpacing(double spacing) {
    if (isSmallPhone()) {
      return spacing * 0.8;
    } else if (isMediumPhone()) {
      return spacing * 0.9;
    } else {
      return spacing;
    }
  }
}