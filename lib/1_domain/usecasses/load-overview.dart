import 'package:dartz/dartz.dart';
import 'package:todoapp/1_domain/entities/todo_collection.dart';
import 'package:todoapp/1_domain/failures/failure.dart';
import 'package:todoapp/2_Application/core/usecase.dart';

import '../repositories/todo_repository.dart';

 class LoadToDoCollections implements UseCase<List<TodoCollection>, NoParams> {
  const LoadToDoCollections({required this.toDoRepository});
  final TodoRepository toDoRepository;


  @override
    Future<Either<Failure, List<TodoCollection>>> call(NoParams params) async {
    try {
      final loadedCollections = await toDoRepository.readTodoCollections();

      return loadedCollections.fold(
            (left) => Left(left),
            (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(stackTrace: e.toString()),
      );
    }
  }
}