import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Import for smooth indicators
import '../../../../controller/banner_controller.dart';

class BannerWidget extends StatefulWidget {
  final double height; // Custom height
  final double width; // Custom width

  BannerWidget({super.key, required this.height, required this.width});

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _currentIndex = 0; // Current index of the carousel

  @override
  Widget build(BuildContext context) {
    final BannerController controller =
        Get.put(BannerController()); // Instantiate the controller

    return Column(
      children: [
        SizedBox(
          height: widget.height, // Set height
          width: widget.width, // Set width
          child: Obx(() {
            // Reactive widget that listens to changes in the controller
            return CarouselSlider.builder(
              itemCount: controller.bannerImages.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: widget.width, // Full width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        controller.bannerImages[index],
                      ), // Image from Firestore
                      fit: BoxFit.cover, // Cover the area
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: widget.height, // Set carousel height
                autoPlay: true, // Auto-play
                aspectRatio: widget.width / widget.height, // Aspect ratio
                enlargeCenterPage: true, // Enlarge center image
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index; // Update current index
                  });
                },
              ),
            );
          }),
        ),
        const SizedBox(height: 10), // Space between carousel and indicator
        Obx(() => buildIndicator(controller)), // Smooth page indicator
      ],
    );
  }

  // Build smooth indicator for the carousel
  Widget buildIndicator(BannerController controller) => AnimatedSmoothIndicator(
        activeIndex: _currentIndex, // Active index
        count: controller.bannerImages.length, // Number of dots
        effect: const ExpandingDotsEffect(
          activeDotColor: Colors.blue, // Active dot color
          dotColor: Colors.grey, // Inactive dot color
          dotHeight: 8,
          dotWidth: 8,
          spacing: 8,
        ),
        onDotClicked: (index) {
          // Handle dot click to navigate to respective page if needed
        },
      );
}
