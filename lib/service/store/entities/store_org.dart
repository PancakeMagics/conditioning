class StoreOrg {
  final String id;
  final String name;
  final String? mainContact;
  final String? address;

  const StoreOrg({
    required this.id,
    required this.name,
    this.mainContact,
    this.address,
  });
}
