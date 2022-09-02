import 'event.dart';
import 'org.dart';
import 'user.dart';

class Topic {
  final String name;
  final List<User> userList;
  final List<Org> orgList;
  final List<Event> eventList;

  const Topic({
    required this.name,
    required this.userList,
    required this.orgList,
    required this.eventList,
  });
}
