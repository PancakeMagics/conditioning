import '../../../store_note.dart';
import '../../store_note_provider.dart';

class StoreNoteProviderFirestore extends StoreNoteProvider {
  const StoreNoteProviderFirestore._sharedInstance();
  factory StoreNoteProviderFirestore() => _shared;
  static const StoreNoteProviderFirestore _shared = StoreNoteProviderFirestore._sharedInstance();

  //TODO: implement firebase
  @override
  Future<void> initialize() => Future(() => null);

  @override
  List<StoreNote> get noteList => List<StoreNote>.generate(
      50, (index) => StoreNote(id: '$index', ownerId: 'noteName of $index'));

  @override
  Future<StoreNote> createOrGetExistNote({required String noteId}) {
    return Future(() => const StoreNote(id: 'cgo id', ownerId: 'cgo name'));
  }

  @override
  Future<Iterable<StoreNote>> getPublicNotes() {
    return Future(() => const [StoreNote(id: 'gpo id', ownerId: 'gpo name')]);
  }

  @override
  Future<Iterable<StoreNote>> getNoteFriends({required String noteId}) {
    return Future(() => const [StoreNote(id: 'guo id', ownerId: 'guo name')]);
  }

  @override
  Future<void> updateNoteName({required String noteId, required String newName}) {
    return Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> deleteNote({required String noteId}) {
    return Future.delayed(const Duration(milliseconds: 500));
  }
}