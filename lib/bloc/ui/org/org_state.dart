part of 'org_bloc.dart';

@immutable
abstract class OrgState extends StoreOrgsState {
  final Org org;

  const OrgState({
    required this.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(orgList: null);
}
