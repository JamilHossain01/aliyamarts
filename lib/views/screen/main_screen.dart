import 'package:aliyamart/views/screen/nav_screen/account_screen.dart';
import 'package:aliyamart/views/screen/nav_screen/cart_screen.dart';
import 'package:aliyamart/views/screen/nav_screen/favourite_screen.dart';
import 'package:aliyamart/views/screen/nav_screen/home_screen.dart';
import 'package:aliyamart/views/screen/nav_screen/siamart_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int _pageIndex = 0;
final List<Widget> _pages = [
  const HomeScreen(),
  const FavouriteScreen(),
  const CartScreen(),
  const SiamartScreen(),
  const AccountScreen(),
];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/home.png',
                  width: 25,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/love.png',
                  width: 25,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/cart.png',
                  width: 25,
                ),
                label: 'cart'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/mart.png',
                  width: 25,
                ),
                label: 'cart'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/user.png',
                  width: 24,
                ),
                label: 'cart'),
          ]),
      body: _pages[_pageIndex],
    );
  }
}
