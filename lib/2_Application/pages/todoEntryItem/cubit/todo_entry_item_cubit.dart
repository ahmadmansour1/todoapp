import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/1_domain/entities/todo_entry.dart';
import 'package:todoapp/1_domain/entities/uniqe_id.dart';
import 'package:todoapp/1_domain/usecasses/load_overview_entry.dart';
import 'package:todoapp/2_Application/core/usecase.dart';

import '../../../../1_domain/usecasses/load_todo_entry_item.dart';

part 'todo_entry_item_state.dart';

class TodoEntryItemCubit extends Cubit<TodoEntryItemState> {
  TodoEntryItemCubit( {required this.loadTodoEntry ,required this.updateToDoEntryStatus , required this.collectionId , required this.entryId}) : super(TodoEntryItemLoadingState());
  final EntryId entryId;
  final CollectionId collectionId ;
  final LoadTodoEntry loadTodoEntry ;
  final UpdateToDoEntryStatus updateToDoEntryStatus ;
  Future<void> fetch() async{

    try{

      final entry = await loadTodoEntry.call(
          TodoEntryIdsParams(collectionId: collectionId , entryId: entryId));
      entry.fold(
            (left) => emit(TodoEntryItemErrorState()),
            (right) => emit(TodoEntryItemLoadedState(todoEntry: right )),
      );
    } on Exception{
      emit(TodoEntryItemErrorState());
    }

  }
  Future <void> update() async {
try {
  final updateEntryItem = await updateToDoEntryStatus.call(
    TodoEntryIdsParams(entryId: entryId, collectionId: collectionId));
  updateEntryItem.fold(
        (left) => emit(TodoEntryItemErrorState()),
        (right) => emit(TodoEntryItemLoadedState(todoEntry: right )),
  );


} catch (e){
  emit(TodoEntryItemErrorState());

}
  }
}
