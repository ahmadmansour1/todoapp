part of 'create_todo_collection_cubit.dart';

@immutable
 class CreateTodoCollectionState extends Equatable{
  final String ? title ;
  final String ? color;
   CreateTodoCollectionState({this.title ,  this.color});
   @override
  List<Object?> get props => [title , color];
   CreateTodoCollectionState copyWith({String ? title, String ? color}){  // to create a new instance of an object
     //It's often used in immutable objects to facilitate updates without modifying the original object
     return CreateTodoCollectionState(color: color ?? this.color , title: title ?? this.title);

   }
}

class CreateTodoCollectionInitial extends CreateTodoCollectionState {}
