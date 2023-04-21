import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  Note({
    required this.name
  });

  @HiveField(0)
  String name;
}