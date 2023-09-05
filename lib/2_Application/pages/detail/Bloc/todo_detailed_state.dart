part of 'todo_detailed_cubit.dart';

@immutable
abstract class TodoDetailedState extends Equatable {
 const TodoDetailedState();
 @override
  List<Object?> get props => [];
}

class TodoDetailedInitial extends TodoDetailedState {

}
class TodoDetailedLoadingState extends TodoDetailedState {

}
class TodoDetailedErrorState extends TodoDetailedState {

}
class TodoDetailedLoadedState extends TodoDetailedState {
  const TodoDetailedLoadedState({required this.entryId});
  final List<EntryId> entryId ;
  @override
  List<Object?> get props => [entryId];
}

