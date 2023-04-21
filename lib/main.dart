import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notepad/entity/note.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(NoteAdapter());
  }
  final box = await Hive.openBox<Note>('notepad_box');
  runApp(MyApp(box: box));
}
