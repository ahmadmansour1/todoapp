import 'package:todoapp/1_domain/entities/uniqe_id.dart';

class TodoEntry{
  final String description;
  final bool isDone ;
  final EntryId id ;
  TodoEntry({required this.id , required this.description , required this.isDone});
  factory TodoEntry.isEmpty(){
    return TodoEntry(
      description:  '',
      isDone: false ,
      id: EntryId(),
    );
  }
  TodoEntry copyWith({
  String ? description ,
  bool ? isDone,
  }) {
    return TodoEntry(id: id, description: description ?? this.description, isDone: isDone ?? this.isDone);
  }
}