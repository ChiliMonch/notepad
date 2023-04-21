import 'package:hive_flutter/adapters.dart';
import 'package:notepad/data/notes_api.dart';

import '../entity/note.dart';

class NoteDatabase implements NotesApi {
  NoteDatabase({
    required this.noteBox
  });
  Box<Note> noteBox;

  @override
  Future<void> initializeDatabase() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(NoteAdapter());
    }
    noteBox = await Hive.openBox<Note>('notepad_box');
  }

  @override
  Future<void> addNote(Note note) async {
    await noteBox.add(note);
  }

  @override
  Future<void> deleteNoteAtIndex(int index) async {
    await noteBox.deleteAt(index);
  }

  @override
  List<Note> getAllNotes() {
    return noteBox.values.toList();
  }

  @override
  void addListenerToNoteChanges(Function() listener) {
    noteBox.listenable().addListener(listener);
  }

  @override
  Future<void> updateNoteAtIndex(int index, Note note) async {
    await noteBox.putAt(index, note);
  }

  @override
  Future<void> clearAllNotes() async {
    await noteBox.clear();
  }
}
