import 'package:contact_manager/screens/contacts_screen.dart';
import 'package:flutter/material.dart';

class FavoratesScreen extends StatelessWidget {
  const FavoratesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactsScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.blue,
                )),
          )
        ],
      ),
      body: Center(
        child: Text('No Favourites'),
      ),
    );
  }
}
