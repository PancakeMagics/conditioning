class StoreEvent {
  final String id;
  final String name;
  final String? time;
  final String? place;

  const StoreEvent({
    required this.id,
    required this.name,
    this.time,
    this.place,
  });
}
