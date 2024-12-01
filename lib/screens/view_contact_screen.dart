import 'package:contact_manager/screens/add_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../contact_provider.dart';
import '../contacts.dart';

class ViewContactScreen extends StatefulWidget {
  final Contact contact;
  const ViewContactScreen({super.key, required this.contact});

  @override
  State<ViewContactScreen> createState() => _ViewContactScreenState();
}

class _ViewContactScreenState extends State<ViewContactScreen> {
  late Contact contact;
  @override
  void initState() {
    super.initState();
    contact =
        widget.contact; // Initialize contact with the passed contact object
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
        builder: (context, contactProvider, child) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Delete Contact'),
                        content: const Text(
                            'Are you sure you want to delete this contact?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              contactProvider.deleteContact(widget.contact);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          )
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.delete,
                // color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: TextButton(
                onPressed: () async {
                  final updatedContact = await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddContactScreen(contact: contact),
                    ),
                  );
                  // If the updated contact is not null, update the UI
                  if (updatedContact != null) {
                    setState(() {
                      contact =
                          updatedContact; // Update the contact with the edited data
                    });
                  }
                },
                child: const Text(
                  'Edit',
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person,
                      size: 100.0,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Name'),
              subtitle: Text(widget.contact.name),
            ),
            ListTile(
              title: const Text('Phone Number'),
              subtitle: Text(widget.contact.phone),
            ),
            ListTile(
              title: const Text('Email'),
              subtitle: Text(widget.contact.email),
            ),
          ],
        ),
      );
    });
  }
}
