import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_matee/screens/main/profile_screen..dart';
import '../../utils/ThemeProvider.dart';
import 'home_screen.dart';
import 'tours_screen.dart';
import 'bookings_screen.dart';
import 'favorites_screen.dart';
import 'ads_screen.dart';


class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Initialize _currentIndex directly instead of using late
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Set the _currentIndex from the widget's initialIndex
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const ToursScreen(),
    const BookingsScreen(),
    const FavoritesScreen(),
    const AdsScreen(),
    const ProfileScreen(),
  ];

  final List<String> _titles = [
    'Home',
    'Tours',
    'Bookings',
    'Favorites',
    'Ads',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 0,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_outlined, Icons.home, 'Home'),
                _buildNavItem(1, Icons.explore_outlined, Icons.explore, 'Tours'),
                _buildNavItem(2, Icons.calendar_today_outlined, Icons.calendar_today, 'Bookings'),
                _buildNavItem(3, Icons.favorite_border_outlined, Icons.favorite, 'Favorites'),
                _buildNavItem(4, Icons.campaign_outlined, Icons.campaign, 'Ads'),
                _buildNavItem(5, Icons.person_outline, Icons.person, 'Profile'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
        onPressed: () {
          // Toggle theme
          themeProvider.toggleTheme();
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          themeProvider.isDarkMode
              ? Icons.light_mode
              : Icons.dark_mode,
          color: Colors.white,
        ),
      )
          : null,
    );
  }

  Widget _buildNavItem(int index, IconData icon, IconData activeIcon, String label) {
    final isSelected = _currentIndex == index;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDarkMode ? Colors.white10 : Theme.of(context).primaryColor.withOpacity(0.1))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : (isDarkMode ? Colors.white60 : Colors.grey),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : (isDarkMode ? Colors.white60 : Colors.grey),
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}