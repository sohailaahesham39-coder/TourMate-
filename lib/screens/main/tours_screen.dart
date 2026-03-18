import 'package:flutter/material.dart';
import '../../models/tour_package.dart';
import '../../widgets/tour_package_card.dart';
import '../../widgets/custom_search_bar.dart';

class ToursScreen extends StatelessWidget {
  const ToursScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Sample data for tour packages
    final List<TourPackage> tourPackages = [
      TourPackage(
        id: '1',
        name: 'Bali Adventure Package',
        image: 'https://images.unsplash.com/photo-1539367628448-4bc5c9d171c8?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
        rating: 4.6,
        reviewCount: 245,
        duration: '5 days',
        price: 899,
        discountPercentage: 15,
      ),
      TourPackage(
        id: '2',
        name: 'Greek Islands Exploration',
        image: 'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
        rating: 4.8,
        reviewCount: 312,
        duration: '7 days',
        price: 1299,
        discountPercentage: 10,
      ),
      TourPackage(
        id: '3',
        name: 'Japan Cultural Tour',
        image: 'https://images.unsplash.com/photo-1528360983277-13d401cdc186?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
        rating: 4.7,
        reviewCount: 187,
        duration: '6 days',
        price: 1150,
        discountPercentage: 12,
      ),
      TourPackage(
        id: '4',
        name: 'Paris City Break',
        image: 'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
        rating: 4.9,
        reviewCount: 421,
        duration: '4 days',
        price: 750,
        discountPercentage: 20,
      ),
      TourPackage(
        id: '5',
        name: 'African Safari Adventure',
        image: 'https://images.unsplash.com/photo-1516426122078-c23e76319801?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
        rating: 4.8,
        reviewCount: 156,
        duration: '10 days',
        price: 2499,
        discountPercentage: 8,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tour Packages',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              // Show filter options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CustomSearchBar(
              hintText: 'Search tour packages...',
              onSearch: (query) {
                // Handle search
              },
            ),
          ),

          // Tour categories
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryChip(context, 'All', true),
                _buildCategoryChip(context, 'Beach', false),
                _buildCategoryChip(context, 'Adventure', false),
                _buildCategoryChip(context, 'Cultural', false),
                _buildCategoryChip(context, 'City Break', false),
                _buildCategoryChip(context, 'Wildlife', false),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Results count and sort options
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  '${tourPackages.length} Tours found',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  'Sort by:',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
                const SizedBox(width: 4),
                DropdownButton<String>(
                  value: 'Popular',
                  items: ['Popular', 'Price (Low to High)', 'Price (High to Low)', 'Rating']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Handle sort change
                  },
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                  underline: const SizedBox(),
                  dropdownColor: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Tour package list
          Expanded(
            child: ListView.builder(
              itemCount: tourPackages.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TourPackageCard(
                    tourPackage: tourPackages[index],
                    onTap: () {
                      // Navigate to tour package details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label, bool isSelected) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: ElevatedButton(
        onPressed: () {
          // Handle category selection
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          backgroundColor: isSelected
              ? Theme.of(context).primaryColor
              : (isDarkMode ? Colors.white10 : Colors.grey.shade100),
          foregroundColor: isSelected
              ? Colors.white
              : (isDarkMode ? Colors.white70 : Colors.black87),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: isSelected
                ? BorderSide.none
                : BorderSide(
              color: isDarkMode ? Colors.white10 : Colors.grey.shade300,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}