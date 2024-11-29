// contact_search_delegate.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../contact_provider.dart'; // Adjust the path as needed

class ContactSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final contactProvider =
        Provider.of<ContactProvider>(context, listen: false);
    final results = contactProvider.contacts
        .where((contact) =>
            contact.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final contact = results[index];
        return ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.phone),
          onTap: () {
            // Perform any action when a contact is tapped
            close(context, contact.name);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // You can implement a suggestion feature if needed
  }
}
