part of 'store_topics_bloc.dart';

@immutable
abstract class StoreTopicsState extends StoreBlocState {
  final List<StoreTopic> topicList;
  const StoreTopicsState({
    required this.topicList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class StoreTopicStateAllStore extends StoreTopicsState {
  const StoreTopicStateAllStore({
    required super.topicList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class StoreTopicsStateRelativeStore extends StoreTopicsState {
  const StoreTopicsStateRelativeStore({
    required super.topicList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
