import 'package:dartz/dartz.dart';
import 'package:todoapp/1_domain/entities/todo_entry.dart';
import 'package:todoapp/1_domain/entities/uniqe_id.dart';
import 'package:todoapp/1_domain/failures/failure.dart';
import 'package:todoapp/2_Application/core/usecase.dart';

import '../repositories/todo_repository.dart';

class UpdateToDoEntryStatus implements UseCase<TodoEntry , TodoEntryIdsParams> {
  final TodoRepository todoRepository;

  UpdateToDoEntryStatus({required this.todoRepository});

  @override
  Future<Either<Failure, TodoEntry>> call(TodoEntryIdsParams params) async {
    try {
     final loadedEntryItem =  await todoRepository.updateToDoEntryStatus(
         collectionId : params.collectionId ,
         entryId: params.entryId);
      return loadedEntryItem.fold(
            (left) => Left(left),
            (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
