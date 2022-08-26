
class LocalDatabaseException implements Exception {}

class DatabaseAlreadyOpen implements LocalDatabaseException {}
class UnableToGetDocumentsDirectory implements LocalDatabaseException {}
class DatabaseIsNotOpenException implements LocalDatabaseException {}
class UserAlreadyExistsInDatabase implements LocalDatabaseException {}

class CouldNotFindUserInDatabase implements LocalDatabaseException {}
class CouldNotDeleteUserInDatabase implements LocalDatabaseException {}
class UserShouldBeSetBeforeReadingAllNotes implements LocalDatabaseException {}

class CouldNotCreateNoteInDatabase implements LocalDatabaseException {}
class CouldNotFindNoteInDatabase implements LocalDatabaseException {}
class CouldNotDeleteNoteInDatabase implements LocalDatabaseException {}
class CouldNotUpdateNoteInDatabase implements LocalDatabaseException {}
