import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../contact_provider.dart';
import '../contacts.dart';

class AddContactScreen extends StatefulWidget {
  final Contact? contact;

  // final Function(Contact) onSubmit;
  AddContactScreen({super.key, this.contact});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final uuid = Uuid();
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;

  late TextEditingController _emailController;

  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    // Pre-fill the fields if a contact is provided
    _nameController = TextEditingController(text: widget.contact?.name ?? '');
    _phoneController = TextEditingController(text: widget.contact?.phone ?? '');
    _emailController = TextEditingController(text: widget.contact?.email ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider =
        Provider.of<ContactProvider>(context, listen: false);

    final currentContact =
        widget.contact ?? Contact(id: '', name: '', phone: '', email: '');

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text(widget.contact == null ? 'Add Contact' : 'Edit Contact'),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
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
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: 'First name'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(hintText: 'Phone number'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter an email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email address',
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              TextButton(
                onPressed: () {
                  final name = _nameController.text.trim();
                  final phone = _phoneController.text.trim();
                  final email = _emailController.text.trim();

                  if (name.isEmpty || phone.isEmpty || email.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All fields are required!')),
                    );
                    return;
                  }

               
                  Contact updatedContact = widget.contact == null
                      ? Contact(
                          id: uuid.v4(), name: name, phone: phone, email: email)
                      : widget.contact!
                          .copyWith(name: name, phone: phone, email: email);

                  if (widget.contact == null) {
                    contactProvider.addContact(updatedContact);
                  } else {
                    contactProvider.updateContact(updatedContact);
                  }

                  // Pass the updated contact back to the previous screen
                  Navigator.pop(context, updatedContact);
                },
                child: Text(
                  widget.contact == null ? 'Add Contact' : 'Save Changes',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
