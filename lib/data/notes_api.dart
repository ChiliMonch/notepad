import 'package:notepad/entity/note.dart';

abstract class NotesApi {
  NotesApi();

  void addListenerToNoteChanges(Function() listener) {}

  void addNote(Note note) {}

  void clearAllNotes() {}

  void deleteNoteAtIndex(int index) {}

  List<Note> getAllNotes() ;

  void initializeDatabase() {}

  void updateNoteAtIndex(int index, Note note) {}
}
