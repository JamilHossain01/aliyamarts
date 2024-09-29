import 'package:aliyamart/views/screen/nav_screen/widgets/banner_widget.dart';
import 'package:aliyamart/views/screen/nav_screen/widgets/category_widget.dart';
import 'package:aliyamart/views/screen/nav_screen/widgets/header_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Add scrolling behavior
        child: Column(
          children: [
            HeaderWidgets(),
            BannerWidget(height: 200, width: MediaQuery.of(context).size.width),
            const CategoryItem(), // Use CategoryItem widget
          ],
        ),
      ),
    );
  }
}
