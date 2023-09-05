import 'package:flutter/material.dart';
import 'package:todoapp/1_domain/entities/todo_entry.dart';

class LoadedTodoEntryItem extends StatelessWidget {
  const LoadedTodoEntryItem({Key? key,required this.onChange ,  required this.entryItem}) : super(key: key);
  final TodoEntry entryItem;
  final Function(bool?) onChange;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: entryItem.isDone,
        onChanged: onChange ,
      title: Text(entryItem.description),

    );
  }
}
