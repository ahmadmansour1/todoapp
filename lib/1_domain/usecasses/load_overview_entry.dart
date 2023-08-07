import 'package:dartz/dartz.dart';
import 'package:todoapp/1_domain/entities/todo_entry.dart';
import 'package:todoapp/1_domain/failures/failure.dart';
import 'package:todoapp/1_domain/repositories/todo_repository.dart';
import 'package:todoapp/2_Application/core/usecase.dart';

class LoadTodoEntry implements UseCase<TodoEntry , TodoEntryIdsParams>{
  final TodoRepository todoRepository ;

  LoadTodoEntry({required this.todoRepository});

  @override
  Future<Either<Failure, TodoEntry>> call(TodoEntryIdsParams params) async {
    try{
      final loadedEntry = await  todoRepository.readTodoEntry(params.collectionId, params.entryId);
      return loadedEntry.fold(
          (left) => Left(left),
          (right) => Right(right),
      );
    } on Exception catch (e){
      return left(ServerFailure(stackTrace: e.toString()));


    }

  }
  
}