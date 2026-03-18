import 'package:flutter/material.dart';
import '../Responsive Utilities/ResponsiveUtil.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Initialize responsive utilities if not already initialized
    if (ResponsiveUtil.screenWidth == 0) {
      ResponsiveUtil.init(context);
    }

    // Adjust padding and font size based on device size
    final horizontalPadding = ResponsiveUtil.isSmallPhone() ? 12.0 : 16.0;
    final verticalPadding = ResponsiveUtil.isSmallPhone() ? 6.0 : 8.0;
    final fontSize = ResponsiveUtil.isSmallPhone() ? 12.0 : 14.0;
    final borderRadius = ResponsiveUtil.isSmallPhone() ? 16.0 : 20.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : (isDarkMode ? Colors.black12 : Colors.grey.shade100),
          borderRadius: BorderRadius.circular(borderRadius),
          border: isSelected
              ? null
              : Border.all(
            color: isDarkMode ? Colors.white10 : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : (isDarkMode ? Colors.white70 : Colors.black87),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}