import 'package:flutter/material.dart' show immutable;
import '../store_note.dart';
import 'provider.dart';

@immutable
abstract class StoreNoteProvider extends StoreProvider {
  abstract final List<StoreNote> noteList;
  const StoreNoteProvider();

  Future<StoreNote> createOrGetExistNote({required String noteId});
  Future<Iterable<StoreNote>> getPublicNotes();
  Future<Iterable<StoreNote>> getNoteFriends({required String noteId});
  Future<void> updateNoteName({required String noteId, required String newName});
  Future<void> deleteNote({required String noteId});
}