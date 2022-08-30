class Event {
  final String id;
  final String name;
  final String? time;
  final String? place;

  const Event({
    required this.id,
    required this.name,
    this.time,
    this.place,
  });
}
