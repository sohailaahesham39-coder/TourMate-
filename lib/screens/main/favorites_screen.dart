import 'package:flutter/material.dart';
import '../../models/destination.dart';
import '../../models/tour_package.dart';
import '../../widgets/destination_card.dart';
import '../../widgets/tour_package_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favorites',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              // Show delete all confirmation
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: isDarkMode ? Colors.white60 : Colors.black54,
          indicatorColor: Theme.of(context).primaryColor,
          indicatorWeight: 3,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          tabs: const [
            Tab(text: 'Destinations'),
            Tab(text: 'Tour Packages'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDestinationsTab(),
          _buildTourPackagesTab(),
        ],
      ),
    );
  }

  Widget _buildDestinationsTab() {
    // Sample data for favorite destinations
    final List<Destination> favoriteDestinations = [
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
        isFavorite: true,
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
        isFavorite: true,
      ),
    ];

    return favoriteDestinations.isEmpty
        ? _buildEmptyState(
      icon: Icons.location_on_outlined,
      title: 'No favorite destinations',
      subtitle: 'Save your favorite destinations to see them here',
    )
        : GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: favoriteDestinations.length,
      itemBuilder: (context, index) {
        return DestinationCard(
          destination: favoriteDestinations[index],
          onTap: () {
            // Navigate to destination details
          },
        );
      },
    );
  }

  Widget _buildTourPackagesTab() {
    // Sample data for favorite tour packages
    final List<TourPackage> favoriteTourPackages = [
      TourPackage(
        id: '1',
        name: 'Bali Adventure Package',
        image: 'https://images.unsplash.com/photo-1539367628448-4bc5c9d171c8?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
        rating: 4.6,
        reviewCount: 245,
        duration: '5 days',
        price: 899,
        discountPercentage: 15,
        isFavorite: true,
      ),
    ];

    return favoriteTourPackages.isEmpty
        ? _buildEmptyState(
      icon: Icons.backpack_outlined,
      title: 'No favorite tour packages',
      subtitle: 'Save your favorite tour packages to see them here',
    )
        : ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favoriteTourPackages.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TourPackageCard(
            tourPackage: favoriteTourPackages[index],
            onTap: () {
              // Navigate to tour package details
            },
          ),
        );
      },
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: isDarkMode ? Colors.white30 : Colors.black12,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              subtitle,
              style: TextStyle(
                color: isDarkMode ? Colors.white60 : Colors.black54,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Navigate to explore screen
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Start Exploring',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}