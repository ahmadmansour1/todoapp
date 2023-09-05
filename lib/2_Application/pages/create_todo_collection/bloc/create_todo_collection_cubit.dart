import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/1_domain/entities/todo_collection.dart';
import 'package:todoapp/1_domain/entities/todo_color.dart';
import 'package:todoapp/1_domain/usecasses/create_todo_collection.dart';
import 'package:todoapp/2_Application/core/usecase.dart';

part 'create_todo_collection_state.dart';

class CreateTodoCollectionCubit extends Cubit<CreateTodoCollectionState> {
  CreateTodoCollectionCubit({required this.createTodoCollection}) : super(CreateTodoCollectionInitial());
final CreateTodoCollection createTodoCollection ;


  void titleChanged ( String title){
   emit(state.copyWith(title: title));

  }


  void colorChanged ( String color){
    emit(state.copyWith(color : color));
  }
  Future <void> submit() async {
    final parsedColorIndex = int.tryParse(state.color ?? '') ?? 0;
    await createTodoCollection.call(TodoCollectionIdParams(
        collection: TodoCollection.empty().copyWith( state.title, TodoColor(currentIndex: parsedColorIndex))));
}
}
