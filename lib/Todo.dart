import 'package:hive/hive.dart';
part 'Todo.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final bool isCompleated;

  Todo({
    required this.title,
    required this.isCompleated,
  });
}
