part of 'note_list_bloc.dart';

abstract class NoteListEvent {}

class LoadNotesEvent extends NoteListEvent {}

class AddNoteEvent extends NoteListEvent {
  final Note note;

  AddNoteEvent(this.note);
}

class DeleteNoteEvent extends NoteListEvent {
  final int index;

  DeleteNoteEvent(this.index);
}