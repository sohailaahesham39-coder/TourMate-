import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../main/main_screen.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final String title;
  final double price;

  const PaymentSuccessScreen({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final String _bookingReference = 'BKG-123456';
  final String _travelDates = 'Jun 15 - Jun 20, 2023';
  final String _travelers = '2 Adults';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success animation
              SizedBox(
                height: 200,
                child: Lottie.network(
                  'https://assets3.lottiefiles.com/packages/lf20_szlepvdh.json',
                  controller: _animationController,
                  height: 200,
                  width: 200,
                  repeat: false,
                  onLoaded: (composition) {
                    _animationController.duration = composition.duration;
                    _animationController.forward();
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Success message
              Text(
                'Payment Successful!',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              Text(
                'Your booking for "${widget.title}" has been confirmed. A confirmation email has been sent to your email address.',
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Booking details
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Booking reference
                    _buildDetailRow(
                      context,
                      'Booking Reference',
                      _bookingReference,
                    ),

                    const SizedBox(height: 12),

                    // Tour name
                    _buildDetailRow(
                      context,
                      'Tour Package',
                      widget.title,
                    ),

                    const SizedBox(height: 12),

                    // Travel dates
                    _buildDetailRow(
                      context,
                      'Travel Dates',
                      _travelDates,
                    ),

                    const SizedBox(height: 12),

                    // Travelers
                    _buildDetailRow(
                      context,
                      'Travelers',
                      _travelers,
                    ),

                    const SizedBox(height: 12),

                    // Payment amount
                    _buildDetailRow(
                      context,
                      'Payment Amount',
                      '\$${widget.price.toStringAsFixed(2)}',
                      isHighlighted: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Navigate to bookings screen to view booking details
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(initialIndex: 2),
                          ),
                              (route) => false,
                        );
                      },
                      icon: const Icon(Icons.receipt_long),
                      label: const Text('View Booking'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                              (route) => false,
                        );
                      },
                      icon: const Icon(Icons.home),
                      label: const Text('Go Home'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Download receipt option
              TextButton.icon(
                onPressed: () {
                  // Show download receipt options
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Receipt will be downloaded shortly'),
                      backgroundColor: Theme.of(context).primaryColor,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.download),
                label: const Text('Download Receipt'),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(
      BuildContext context,
      String label,
      String value, {
        bool isHighlighted = false,
      }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isDarkMode ? Colors.white70 : Colors.black54,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isHighlighted
                ? Theme.of(context).primaryColor
                : (isDarkMode ? Colors.white : Colors.black),
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}