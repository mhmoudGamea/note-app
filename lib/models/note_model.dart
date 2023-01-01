import 'package:hive/hive.dart';

part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  int color;

  NoteModel({
    required this.name,
    required this.description,
    required this.date,
    required this.color,
  });
}
