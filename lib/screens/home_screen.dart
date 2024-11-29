import 'package:contact_manager/components/custom_bottom_nav.dart';
import 'package:contact_manager/screens/contacts_screen.dart';
import 'package:contact_manager/screens/favorates_screen.dart';
import 'package:flutter/material.dart';

import '../contacts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int selectedIndex = 0;
  List<Contact> contacts = [];

  void addContact(Contact contact) {
    setState(() {
      contacts.add(contact);
    });
  }

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
        children: const[
           ContactsScreen(),
           FavoratesScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        pageController: pageController,
      ),
    );
  }
}
