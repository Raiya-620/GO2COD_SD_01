import 'package:contact_manager/components/custom_bottom_nav.dart';
import 'package:contact_manager/screens/contacts_screen.dart';
import 'package:contact_manager/screens/favorates_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex =
                index; // Update the bottom nav when the page changes
          });
        },
        children: const [
          FavoratesScreen(),
          ContactsScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        pageController: pageController,
      ),
    );
  }
}
