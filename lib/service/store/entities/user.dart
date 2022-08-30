class User {
  final String id;
  final String name;
  final String? contact;
  final String? hobby;

  const User({
    required this.id,
    required this.name,
    this.contact,
    this.hobby,
  });
}
