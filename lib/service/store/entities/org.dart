class Org {
  final String id;
  final String name;
  final String? mainContact;
  final String? address;

  const Org({
    required this.id,
    required this.name,
    this.mainContact,
    this.address,
  });
}
