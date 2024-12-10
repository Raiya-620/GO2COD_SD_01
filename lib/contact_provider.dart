import 'package:flutter/material.dart';

import 'contacts.dart';


class ContactProvider with ChangeNotifier {
  List<Contact> _contacts = [];
  List<Contact> _favourites = [];

  List<Contact> get contacts => _contacts;
  List<Contact> get favourites => _favourites;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners(); 
  }





  void addFavourite(Contact contact) {
    _favourites.add(contact);
    notifyListeners();
  }

  void deleteContact(Contact contact) {
    _contacts.remove(contact);
    notifyListeners();
  }

  void removeFavourite(Contact contact) {
    _favourites.remove(contact);
    notifyListeners();
  }

 

  void updateContact(Contact updatedContact) {
    final index = _contacts.indexWhere((contact) => contact.id == updatedContact.id);
    if (index != -1) {
      _contacts[index] = updatedContact;
      notifyListeners();
    }
  }



  void toggleFavouriteStatus(String contactId) {
    final contact = _contacts.firstWhere((c) => c.id == contactId);
    contact.toggleFavouriteStatus(); 
    notifyListeners(); 
  }


void editContact(Contact updatedContact) {
  final index = _contacts.indexWhere((c) => c.id == updatedContact.id);
  if (index != -1) {
    _contacts[index] = updatedContact;
    notifyListeners(); 
  }
}


}


  

