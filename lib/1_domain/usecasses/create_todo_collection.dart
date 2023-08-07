import 'package:dartz/dartz.dart';
import 'package:todoapp/1_domain/entities/todo_collection.dart';
import 'package:todoapp/1_domain/failures/failure.dart';
import 'package:todoapp/1_domain/repositories/todo_repository.dart';
import 'package:todoapp/2_Application/core/usecase.dart';

class CreateTodoCollection implements UseCase<bool , TodoCollectionIdParams>{
  final TodoRepository todoRepository;

  CreateTodoCollection({required this.todoRepository});

  @override
  Future<Either<Failure, bool>> call(params) async {
   try{
  final result = await todoRepository.CreateTodoCollection(params.collection );
  return result.fold((left) =>Left(left) ,
          (right) => Right(right),
  );
   } on Exception catch(e){
     return left(ServerFailure(stackTrace: e.toString()));
   }
  }


}