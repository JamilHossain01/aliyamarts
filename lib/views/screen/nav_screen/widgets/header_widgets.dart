import 'package:flutter/material.dart';

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.16,
      child: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/icons/searchBanner.jpeg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Search TextField
          Positioned(
            top: 50,
            left: 21,
            child: SizedBox(
              width: 290,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: _buildIcon('assets/icons/camera.png'),
                  prefixIcon: _buildIcon('assets/icons/searc1.png'),
                  hintText: 'Search anything',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: _buildBorder(),
                  focusedBorder: _buildBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 37,
                    vertical: 13,
                  ),
                ),
              ),
            ),
          ),
          // Notification Bell
          Positioned(
            left: 310,
            top: 60,
            child: _buildIconButton('assets/icons/bell.png', () {
              // Handle bell icon tap
            }),
          ),
          // Message Icon
          Positioned(
            left: 350,
            top: 60,
            child: _buildIconButton('assets/icons/message.png', () {
              // Handle message icon tap
            }),
          ),
        ],
      ),
    );
  }

  // Helper method to build an icon
  Widget _buildIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        assetPath,
        width: 16,
        height: 16,
      ),
    );
  }

  // Helper method to build icon buttons
  Widget _buildIconButton(String assetPath, VoidCallback onTap) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: 31,
          height: 31,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetPath),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build input borders
  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }
}
