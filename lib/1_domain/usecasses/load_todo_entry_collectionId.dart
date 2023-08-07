import 'package:dartz/dartz.dart';
import 'package:todoapp/1_domain/entities/uniqe_id.dart';
import 'package:todoapp/1_domain/failures/failure.dart';
import 'package:todoapp/1_domain/repositories/todo_repository.dart';
import 'package:todoapp/2_Application/core/usecase.dart';

class LoadTodoEntryIds implements UseCase<List<EntryId>, CollectionIdParams> {
  final TodoRepository todoRepository;

  LoadTodoEntryIds({required this.todoRepository});

  @override
  Future<Either<Failure, List<EntryId>>> call(CollectionIdParams params) async {
    try {
      final loadedEntry =
          await todoRepository.readTodoEntryIds(params.collectionId);
      return loadedEntry.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
