import 'package:flutter/material.dart';
import 'package:todoapp/1_domain/entities/todo_color.dart';
import 'package:todoapp/1_domain/entities/uniqe_id.dart';

class TodoCollection{
  final String title ;
  final CollectionId id;
  final TodoColor todoColor ;

  TodoCollection({required this.title, required this.id, required this.todoColor});
 factory TodoCollection.empty() {
   return TodoCollection(title: ' ' , id: CollectionId(), todoColor: TodoColor(currentIndex: 0));

 }
 TodoCollection copyWith(String ? title  ,TodoColor? todoColor){
   return TodoCollection(title: title ?? this.title, id: id, todoColor: todoColor ?? this.todoColor);
 }
}