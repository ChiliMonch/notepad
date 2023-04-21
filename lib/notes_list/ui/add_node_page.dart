import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/entity/note.dart';
import 'package:notepad/notes_list/bloc/note_list_bloc.dart';

class AddNodeWidget extends StatefulWidget {
  const AddNodeWidget({super.key});

  @override
  State<AddNodeWidget> createState() => _AddNodeWidgetState();
}

class _AddNodeWidgetState extends State<AddNodeWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final NoteListBloc noteBloc = BlocProvider.of<NoteListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add node'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              maxLines: 13,
              controller: _controller,
              autofocus: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'text'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                noteBloc.add(AddNoteEvent(Note(name: _controller.text)));
                Navigator.of(context).pop('/');
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
