import 'package:contact_manager/screens/view_contact_screen.dart';
import 'package:flutter/material.dart';

import 'add_contact_screen.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddContactScreen(),
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
          child: ListView(
            children: [
              const Text(
                'Contacts',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.person),
                title: const Text(
                  'Mohammed Suraiya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                subtitle: const Text('My Card'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewContactScreen(),
                    ),
                  );
                },
                title: const Text(
                  'Mohammed Suraiya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Divider(),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Mohammed Suraiya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Divider(),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Mohammed Suraiya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Divider(),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Mohammed Suraiya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Divider(),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Mohammed Suraiya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Divider(),
              ),
              ListTile(
                onTap: () {},
                title: const Text(
                  'Mohammed Suraiya',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
