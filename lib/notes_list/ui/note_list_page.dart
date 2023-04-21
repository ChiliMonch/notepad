import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notepad/data/note_data_base.dart';
import 'package:notepad/entity/note.dart';
import 'package:notepad/notes_list/bloc/note_list_bloc.dart';

class NoteListPage extends StatelessWidget {
  const NoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Note List'),
      ),
      body: BlocBuilder<NoteListBloc, NoteListState>(
        builder: (context, state) {
          final notes = state.notes;
          return Scaffold(
            body: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) =>
                  _NoteListTittleWidget(
                index: index,
                notes: notes[index],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(            
              child: const Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed('/add_node'),
            ),
          );
        },
      ),
    );
  }
}

class _NoteListTittleWidget extends StatelessWidget {
  final int index;
  final Note notes;
  const _NoteListTittleWidget(
      {super.key, required this.index, required this.notes});

  @override
  Widget build(BuildContext context) {
    final NoteListBloc noteBloc = BlocProvider.of<NoteListBloc>(context);

    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => noteBloc.add(DeleteNoteEvent(index)),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        color: Colors.amber[100],
        margin: const EdgeInsets.only(left: 8,right: 8,top: 8),
        child: ListTile(
          title: Text(
            notes.name,
            maxLines: 1,
            style: const TextStyle(fontSize: 18),
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            print(index);
          },
        ),
      ),
    );
  }
}
