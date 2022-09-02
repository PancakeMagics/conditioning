part of 'store_orgs_bloc.dart';

@immutable
abstract class StoreOrgsState extends StoreState {
  final List<Org>? orgList;
  const StoreOrgsState({
    required this.orgList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class StoreOrgsStateAllStore extends StoreOrgsState {
  const StoreOrgsStateAllStore({
    required super.orgList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class StoreOrgsStateRelativeStore extends StoreOrgsState {
  const StoreOrgsStateRelativeStore({
    required super.orgList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
