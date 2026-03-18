import 'package:flutter/material.dart';
import '../Responsive Utilities/ResponsiveUtil.dart';


class CustomSearchBar extends StatefulWidget {
  final String hintText;
  final Function(String) onSearch;

  const CustomSearchBar({
    Key? key,
    required this.hintText,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Initialize responsive utilities if not already initialized
    if (ResponsiveUtil.screenWidth == 0) {
      ResponsiveUtil.init(context);
    }

    // Responsive adjustments
    final height = ResponsiveUtil.isSmallPhone() ? 48.0 : 56.0;
    final iconSize = ResponsiveUtil.isSmallPhone() ? 20.0 : 24.0;
    final fontSize = ResponsiveUtil.isSmallPhone() ? 14.0 : 16.0;
    final borderRadius = ResponsiveUtil.isSmallPhone() ? 12.0 : 16.0;
    final clearButtonSize = ResponsiveUtil.isSmallPhone() ? 36.0 : 40.0;
    final horizontalPadding = ResponsiveUtil.isSmallPhone() ? 12.0 : 16.0;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white10 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: isDarkMode ? Colors.white10 : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: horizontalPadding),
          Icon(
            Icons.search,
            color: isDarkMode ? Colors.white54 : Colors.grey,
            size: iconSize,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _controller,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: fontSize,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: isDarkMode ? Colors.white38 : Colors.grey,
                  fontSize: fontSize,
                ),
                border: InputBorder.none,
              ),
              onSubmitted: widget.onSearch,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_controller.text.isNotEmpty) {
                _controller.clear();
                widget.onSearch('');
              }
            },
            child: Container(
              width: clearButtonSize,
              height: clearButtonSize,
              decoration: BoxDecoration(
                color: _controller.text.isNotEmpty
                    ? (isDarkMode ? Colors.white10 : Colors.grey.shade200)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(borderRadius * 0.75),
              ),
              child: Icon(
                Icons.close,
                color: _controller.text.isNotEmpty
                    ? (isDarkMode ? Colors.white : Colors.black)
                    : Colors.transparent,
                size: iconSize * 0.8,
              ),
            ),
          ),
          SizedBox(width: ResponsiveUtil.isSmallPhone() ? 4 : 8),
          Container(
            height: height * 0.7,
            width: 1,
            color: isDarkMode ? Colors.white10 : Colors.grey.shade300,
          ),
          IconButton(
            onPressed: () {
              // Open filter options
            },
            icon: Icon(
              Icons.filter_list,
              color: isDarkMode ? Colors.white54 : Colors.grey,
              size: iconSize,
            ),
            iconSize: iconSize,
            padding: EdgeInsets.all(ResponsiveUtil.isSmallPhone() ? 8 : 12),
            constraints: const BoxConstraints(),
          ),
          SizedBox(width: ResponsiveUtil.isSmallPhone() ? 4 : 8),
        ],
      ),
    );
  }
}