import 'package:conditioning/service/store/entities/store_topic.dart';
import 'package:flutter/material.dart' show immutable;
import 'provider.dart';

@immutable
abstract class StoreTopicProvider extends StoreProvider {
  abstract final List<StoreTopic> topicList;
  const StoreTopicProvider();

  Future<StoreTopic> createOrGetExistTopic({required String topicId});
  Future<Iterable<StoreTopic>> getPublicTopics();
  Future<Iterable<StoreTopic>> getTopicFriends({required String topicId});
  Future<void> updateTopicName({required String topicId, required String newName});
  Future<void> deleteTopic({required String topicId});
}