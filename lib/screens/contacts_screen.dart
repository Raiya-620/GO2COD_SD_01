import 'package:contact_manager/screens/view_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../contact_provider.dart';

import 'add_contact_screen.dart';

class ContactsScreen extends StatefulWidget {

  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
  
    final contactProvider = Provider.of<ContactProvider>(context);
    final contacts = contactProvider.contacts;

   
    final filteredContacts = contacts
        .where((contact) =>
            contact.name.toLowerCase().contains(query.toLowerCase()) ||
            contact.phone.contains(query))
        .toList();

 
    filteredContacts
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              print("Add button pressed");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddContactScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              if (contacts.isNotEmpty) 
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Search Contacts',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),


              Expanded(
                child: filteredContacts.isEmpty
                    ? const Center(child: Text('No Contacts Available'))
                    : ListView.builder(
                        itemCount: filteredContacts.length,
                        itemBuilder: (context, index) {
                          final contact = filteredContacts[index];
                          return ListTile(
                            onTap: () {
                              print('clicked');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewContactScreen(
                                    contact: contact,
                                  ),
                                ),
                              );
                            },
                            title: Text(contact.name),
                            subtitle: Text(contact.phone),
                            trailing: IconButton(
                                onPressed: () {
                                  contactProvider.addFavourite(contact);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          '${contact.name} has been added to Favourites'),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.favorite_border)),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
