import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notepad/data/note_data_base.dart';
import 'package:notepad/entity/note.dart';

part 'note_list_event.dart';
part 'note_list_state.dart';

class NoteListBloc extends Bloc<NoteListEvent, NoteListState> {
  final NoteDatabase noteDatabase;

  NoteListBloc(this.noteDatabase)
      : super(NoteListState(
          notes: noteDatabase.getAllNotes(),
        )) {
    on<LoadNotesEvent>(_loadNotesEvent);
    on<AddNoteEvent>(_addNoteEvent);
    on<DeleteNoteEvent>(_deleteNoteEvent);
  }

  void _loadNotesEvent(
      LoadNotesEvent event, Emitter<NoteListState> emit)  {
    final notes = noteDatabase.getAllNotes();
    emit(NoteListState(notes: notes));
  }

  void _addNoteEvent(AddNoteEvent event, Emitter<NoteListState> emit) async {
    await noteDatabase.addNote(event.note);
    final notes =  noteDatabase.getAllNotes();
    emit(NoteListState(notes: notes));
  }

  void _deleteNoteEvent(
      DeleteNoteEvent event, Emitter<NoteListState> emit) async {
    await noteDatabase.deleteNoteAtIndex(event.index);
    final notes =  noteDatabase.getAllNotes();
    emit(NoteListState(notes: notes));
  }

}
