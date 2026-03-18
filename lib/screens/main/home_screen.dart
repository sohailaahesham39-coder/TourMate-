import 'package:flutter/material.dart';
import '../../Responsive Utilities/ResponsiveUtil.dart';
import '../../models/destination.dart';
import '../../models/tour_package.dart';
import '../../widgets/destination_card.dart';
import '../../widgets/tour_package_card.dart';
import '../../widgets/category_chip.dart';
import '../../widgets/custom_search_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    'All',
    'Popular',
    'Beach',
    'Mountain',
    'Adventure',
    'Cultural',
    'City',
    'Nature',
  ];

  int _selectedCategoryIndex = 0;

  // Sample data for destinations
  final List<Destination> destinations = [
    Destination(
      id: '1',
      name: 'Bali, Indonesia',
      image: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      rating: 4.8,
      reviewCount: 487,
      description: 'Experience paradise on Earth with pristine beaches, lush rice terraces, and vibrant culture.',
      price: 650,
      location: 'Indonesia',
      category: 'Beach',
    ),
    Destination(
      id: '2',
      name: 'Santorini, Greece',
      image: 'https://images.unsplash.com/photo-1507501336603-6e31db2be093?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      rating: 4.9,
      reviewCount: 632,
      description: 'Iconic white-washed buildings with blue domes overlooking the Aegean Sea.',
      price: 950,
      location: 'Greece',
      category: 'Cultural',
    ),
    Destination(
      id: '3',
      name: 'Kyoto, Japan',
      image: 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      rating: 4.7,
      reviewCount: 398,
      description: 'Ancient temples, traditional teahouses, and stunning gardens in Japan\'s cultural heart.',
      price: 750,
      location: 'Japan',
      category: 'Cultural',
    ),
  ];

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
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Initialize responsive utilities
    ResponsiveUtil.init(context);

    // Get adaptive padding
    final horizontalPadding = ResponsiveUtil.getAdaptivePadding(horizontal: 16, vertical: 0);
    final spacing = ResponsiveUtil.getAdaptiveSpacing(16);
    final titleFontSize = ResponsiveUtil.fontSize(1.2);
    final subtitleFontSize = ResponsiveUtil.fontSize(0.9);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: spacing, bottom: spacing * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App bar with search
              Padding(
                padding: horizontalPadding,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore',
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          'Discover your perfect destination',
                          style: TextStyle(
                            fontSize: subtitleFontSize,
                            color: isDarkMode ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: ResponsiveUtil.adaptiveSize(1.9),
                      height: ResponsiveUtil.adaptiveSize(1.9),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.notifications_outlined,
                          color: Theme.of(context).primaryColor,
                          size: ResponsiveUtil.adaptiveSize(1.0),
                        ),
                        onPressed: () {
                          // Handle notification
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: spacing * 1.5),

              // Search bar
              Padding(
                padding: horizontalPadding,
                child: CustomSearchBar(
                  hintText: 'Search destinations, hotels...',
                  onSearch: (query) {
                    // Handle search
                  },
                ),
              ),

              SizedBox(height: spacing * 1.5),

              // Categories horizontal list
              SizedBox(
                height: ResponsiveUtil.adaptiveSize(1.7),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  padding: horizontalPadding,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: spacing * 0.75),
                      child: CategoryChip(
                        label: categories[index],
                        isSelected: _selectedCategoryIndex == index,
                        onTap: () {
                          setState(() {
                            _selectedCategoryIndex = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: spacing * 1.5),

              // Popular destinations section
              Padding(
                padding: horizontalPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Destinations',
                      style: TextStyle(
                        fontSize: ResponsiveUtil.fontSize(1.1),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to all destinations
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveUtil.fontSize(0.9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: spacing),

              // Destinations horizontal list
              SizedBox(
                height: ResponsiveUtil.isSmallPhone() ? 250 : 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destinations.length,
                  padding: horizontalPadding,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: spacing),
                      child: DestinationCard(
                        destination: destinations[index],
                        onTap: () {
                          // Navigate to destination details
                        },
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: spacing * 1.5),

              // Special offers banner
              Padding(
                padding: horizontalPadding,
                child: Container(
                  width: double.infinity,
                  height: ResponsiveUtil.isSmallPhone() ? 110 : 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -30,
                        bottom: -30,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        left: -20,
                        top: -20,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ResponsiveUtil.adaptiveSize(1.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: ResponsiveUtil.adaptiveSize(0.33),
                                    vertical: ResponsiveUtil.adaptiveSize(0.17),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'SPECIAL OFFER',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ResponsiveUtil.fontSize(0.5),
                                    ),
                                  ),
                                ),
                                SizedBox(height: ResponsiveUtil.adaptiveSize(0.33)),
                                Text(
                                  '30% OFF',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ResponsiveUtil.fontSize(1.2),
                                  ),
                                ),
                                Text(
                                  'On Paris Packages',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveUtil.fontSize(0.58),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to special offer
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF6A11CB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: ResponsiveUtil.adaptiveSize(0.5),
                                  vertical: ResponsiveUtil.adaptiveSize(0.33),
                                ),
                              ),
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: ResponsiveUtil.fontSize(0.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: spacing * 1.5),

              // Tour packages section
              Padding(
                padding: horizontalPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Tour Packages',
                      style: TextStyle(
                        fontSize: ResponsiveUtil.fontSize(1.1),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to all tour packages
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveUtil.fontSize(0.9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: spacing),

              // Tour packages list
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: tourPackages.length,
                padding: horizontalPadding,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: spacing),
                    child: TourPackageCard(
                      tourPackage: tourPackages[index],
                      onTap: () {
                        // Navigate to tour package details
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}