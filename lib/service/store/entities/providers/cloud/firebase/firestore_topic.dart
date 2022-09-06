import '../../../store_topic.dart';
import '../../store_topic_provider.dart';

class StoreTopicProviderFirestore extends StoreTopicProvider {
  const StoreTopicProviderFirestore._sharedInstance();
  factory StoreTopicProviderFirestore() => _shared;
  static const StoreTopicProviderFirestore _shared = StoreTopicProviderFirestore._sharedInstance();

  //TODO: implement firebase
  @override
  Future<void> initialize() => Future(() => null);

  @override
  List<StoreTopic> get topicList => List<StoreTopic>.generate(
      50, (index) => StoreTopic(id: '$index', name: 'topicName of $index'));

  @override
  Future<StoreTopic> createOrGetExistTopic({required String topicId}) {
    return Future(() => const StoreTopic(id: 'cgo id', name: 'cgo name'));
  }

  @override
  Future<Iterable<StoreTopic>> getPublicTopics() {
    return Future(() => const [StoreTopic(id: 'gpo id', name: 'gpo name')]);
  }

  @override
  Future<Iterable<StoreTopic>> getTopicFriends({required String topicId}) {
    return Future(() => const [StoreTopic(id: 'guo id', name: 'guo name')]);
  }

  @override
  Future<void> updateTopicName({required String topicId, required String newName}) {
    return Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> deleteTopic({required String topicId}) {
    return Future.delayed(const Duration(milliseconds: 500));
  }
}