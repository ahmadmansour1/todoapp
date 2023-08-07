import 'package:dartz/dartz.dart';
import 'package:todoapp/1_domain/entities/todo_collection.dart';
import 'package:todoapp/1_domain/entities/todo_color.dart';
import 'package:todoapp/1_domain/entities/uniqe_id.dart';
import 'package:todoapp/1_domain/failures/failure.dart';
import 'package:todoapp/1_domain/repositories/todo_repository.dart';
import 'package:todoapp/1_domain/entities/todo_entry.dart';


 class TodoRepoMock implements TodoRepository { // the data source is mocked, meaning the actual data is not fetched from an external source like a server or database.
  final List<TodoEntry> toDoEntries = List.generate( //assigned unique IDs (of type EntryId) and descriptions
    100,
        (index) => TodoEntry(
      id: EntryId.fromUinqueString(index.toString()),
      description: 'description $index',
      isDone: false,
    ),
  );

  final toDoCollections = List<TodoCollection>.generate( //assigned unique IDs (of type CollectionId) and descriptions
    10,
        (index) => TodoCollection(
      id: CollectionId.fromUinqueString(index.toString()),
      title: 'title $index',
      todoColor: TodoColor(
        currentIndex: index % TodoColor.preDefinedColors.length,
      ),
    ),
  );






  @override
  Future<Either<Failure, List<TodoCollection>>> readTodoCollections() {
    try {
      return Future.delayed(
        const Duration(milliseconds: 200),
            () => Right(toDoCollections),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, TodoEntry>> readTodoEntry(CollectionId collectionId, EntryId entryId) {
    try {
      final selectedEntryItem = toDoEntries.firstWhere(
            (element) => element.id == entryId,  //toDoEntries.firstWhere to find the TodoEntry with a matching entryId.
      );

      return Future.delayed(
        const Duration(milliseconds: 200),
            () => Right(selectedEntryItem),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }


  @override
  Future<Either<Failure, List<EntryId>>> readTodoEntryIds(CollectionId collectionId) {
    try {
      final startIndex = int.parse(collectionId.value) * 10;
      final endIndex = startIndex + 10;
      final entryIds = toDoEntries.sublist(startIndex, endIndex).map((entry) => entry.id).toList();

      return Future.delayed(
        const Duration(milliseconds: 300),
            () => Right(entryIds),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }


  @override
  Future<Either<Failure, TodoEntry>> updateToDoEntryStatus(
      {required EntryId entryId,required CollectionId collectionId}) {
    final index = toDoEntries.indexWhere((entry) => entry.id == entryId);
    final entryToUpdate = toDoEntries[index];
    final updateEntry =  toDoEntries[index] = toDoEntries[index].copyWith(isDone: !entryToUpdate.isDone);
    toDoEntries[index] = updateEntry;
    return Future.delayed(const Duration(milliseconds: 100), () => Right(updateEntry));


  }
  }







