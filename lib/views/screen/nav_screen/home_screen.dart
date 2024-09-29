import 'package:aliyamart/views/screen/nav_screen/widgets/banner_widget.dart';
import 'package:aliyamart/views/screen/nav_screen/widgets/header_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidgets(),
          BannerWidget(height: 200, width: MediaQuery.of(context).size.width),
        ],
      ),
    );
  }
}
