import 'package:flutter/material.dart';

class ViewContactScreen extends StatelessWidget {
  const ViewContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextButton(
              onPressed: () {},
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
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'First name'),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Last name'),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Phone number'),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Email address'),
            ),
          )
        ],
      ),
    );
  }
}
