import 'package:contact_manager/contact_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoratesScreen extends StatelessWidget {
  const FavoratesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    final favorites = contactProvider.favourites;
    final contacts = contactProvider.contacts;
    return Scaffold(
      appBar: AppBar(),
      body: contacts.isEmpty
          ? Center(
              child: Text(
                'No Favourites',
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final contact = favorites[index];
                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.email),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                     
                      contactProvider.removeFavourite(contact);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                '${contact.name} has been removed from favorites')),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
