import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/1_domain/entities/uniqe_id.dart';

part 'create_todo_entry_state.dart';

class CreateTodoEntryCubit extends Cubit<CreateTodoEntryState> {
  CreateTodoEntryCubit({required this.collectionId}) : super(const CreateTodoEntryState());
  final CollectionId collectionId ;
 // final CreateTodoEntry createTodoEntry;
void descriptionChanged(){
  emit(CreateTodoEntryState());
}
void submit(){

}

}
