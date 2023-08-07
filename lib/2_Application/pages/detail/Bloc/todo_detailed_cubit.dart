import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/2_Application/core/usecase.dart';

import '../../../../1_domain/entities/uniqe_id.dart';
import '../../../../1_domain/usecasses/load_todo_entry_collectionId.dart';
part 'todo_detailed_state.dart';

class TodoDetailedCubit extends Cubit<TodoDetailedState> {
  TodoDetailedCubit({required this.loadTodoEntryIds , required this.collectionId}) : super(TodoDetailedInitial());
  final CollectionId collectionId ;
  final LoadTodoEntryIds loadTodoEntryIds ;
  Future<void> fetch() async{
   emit(TodoDetailedErrorState());
   try{

     final entryId = await loadTodoEntryIds.call(
         CollectionIdParams(collectionId: collectionId));
     entryId.fold(
           (left) {
         emit(TodoDetailedErrorState());
       },
           (right) {
         emit(TodoDetailedLoadedState(entryId: right));
       },
     );
   } on Exception{
     emit(TodoDetailedErrorState());
   }

  }



}
