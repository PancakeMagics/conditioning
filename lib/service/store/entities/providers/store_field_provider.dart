import 'package:flutter/material.dart' show immutable;
import '../store_field.dart';
import 'provider.dart';

@immutable
abstract class StoreFieldProvider extends StoreProvider {
  abstract final List<StoreField> fieldList;
  const StoreFieldProvider();

  Future<StoreField> createOrGetExistField({required String fieldId});
  Future<Iterable<StoreField>> getPublicFields();
  Future<Iterable<StoreField>> getFieldFriends({required String fieldId});
  Future<void> updateFieldName({required String fieldId, required String newName});
  Future<void> deleteField({required String fieldId});
}