part of 'create_todo_entry_cubit.dart';

@immutable
class CreateTodoEntryState extends Equatable{
  final String ? description ;

  const CreateTodoEntryState({this.description});
  @override
  List<Object?> get props => [description];
  CreateTodoEntryState copyWith({String ? description}){  // to create a new instance of an object
    //It's often used in immutable objects to facilitate updates without modifying the original object
    return CreateTodoEntryState( description: description ?? this.description);
  }
}


