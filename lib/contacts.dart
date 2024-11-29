class Contact {
  final String id;
  final String name;
  final String email;
  final String phone;
  bool isFavourite;

  Contact(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      this.isFavourite = false});

  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
  }

Contact copyWith({
  String? id,
  String? name,
  String? phone,
  String? email,
  bool? isFavourite,
}) {
  return Contact(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    isFavourite: isFavourite ?? this.isFavourite,
  );
}



}
