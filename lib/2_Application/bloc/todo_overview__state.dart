part of 'todo_overview__cubit.dart';

@immutable
abstract class TodoOverviewState extends Equatable {
  @override
  List<Object?> get props => [];

}

class TodoOverviewInitial extends TodoOverviewState {}
class TodoOverviewErrorState extends TodoOverviewState{

}
class TodoOverviewLoading extends TodoOverviewState{

}
class TodoOverviewLoaded extends TodoOverviewState{
  final List<TodoCollection> collections;

  TodoOverviewLoaded({required this.collections});
  @override
  List<Object?> get props => [collections];
}

