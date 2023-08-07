part of 'todo_entry_item_cubit.dart';

@immutable
abstract class TodoEntryItemState extends Equatable {
  const TodoEntryItemState();
 @override
  List<Object?> get props => [];
}

class TodoEntryItemInitial extends TodoEntryItemState {}
class TodoEntryItemLoadingState extends TodoEntryItemState {}
class TodoEntryItemErrorState extends TodoEntryItemState {}
class TodoEntryItemLoadedState extends TodoEntryItemState {
final TodoEntry todoEntry ;
const TodoEntryItemLoadedState({required this.todoEntry});

@override
List<Object?> get props => [todoEntry];
}