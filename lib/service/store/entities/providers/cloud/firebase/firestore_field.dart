import '../../../store_field.dart';
import '../../store_field_provider.dart';

class StoreFieldProviderFirestore extends StoreFieldProvider {
  const StoreFieldProviderFirestore._sharedInstance();
  factory StoreFieldProviderFirestore() => _shared;
  static const StoreFieldProviderFirestore _shared = StoreFieldProviderFirestore._sharedInstance();

  //TODO: implement firebase
  @override
  Future<void> initialize() => Future(() => null);

  @override
  List<StoreField> get fieldList => List<StoreField>.generate(
      50, (index) => StoreField(id: '$index', name: 'fieldName of $index'));

  @override
  Future<StoreField> createOrGetExistField({required String fieldId}) {
    return Future(() => const StoreField(id: 'cgo id', name: 'cgo name'));
  }

  @override
  Future<Iterable<StoreField>> getPublicFields() {
    return Future(() => const [StoreField(id: 'gpo id', name: 'gpo name')]);
  }

  @override
  Future<Iterable<StoreField>> getFieldFriends({required String fieldId}) {
    return Future(() => const [StoreField(id: 'guo id', name: 'guo name')]);
  }

  @override
  Future<void> updateFieldName({required String fieldId, required String newName}) {
    return Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> deleteField({required String fieldId}) {
    return Future.delayed(const Duration(milliseconds: 500));
  }
}