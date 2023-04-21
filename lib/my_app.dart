import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notepad/data/note_data_base.dart';
import 'package:notepad/entity/note.dart';
import 'package:notepad/notes_list/bloc/note_list_bloc.dart';
import 'package:notepad/notes_list/ui/add_node_page.dart';
import 'package:notepad/notes_list/ui/note_list_page.dart';
import 'package:notepad/theme/theme.dart';

class MyApp extends StatelessWidget {
  final Box<Note> box;
  const MyApp({super.key, required this.box});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteListBloc(NoteDatabase(noteBox: box)),
      child: MaterialApp(
              theme: FlutterTodosTheme.light,
      darkTheme: FlutterTodosTheme.dark,
        title: 'notepad',
        initialRoute: '/',
        routes: {
          '/': (context) => const NoteListPage(),
          '/add_node': (context) => const AddNodeWidget(),
        },
      ),
    );
  }
}
