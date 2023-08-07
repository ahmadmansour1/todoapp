import 'package:dartz/dartz.dart';
import 'package:todoapp/1_domain/entities/todo_collection.dart';
import 'package:todoapp/1_domain/entities/todo_entry.dart';
import 'package:todoapp/1_domain/entities/uniqe_id.dart';

import '../failures/failure.dart';

abstract class TodoRepository {
  Future<Either<Failure , List<TodoCollection>>> readTodoCollections();
  Future<Either<Failure , TodoEntry>> readTodoEntry
      (CollectionId collectionId, EntryId entryId);
  Future<Either<Failure , List<EntryId>>> readTodoEntryIds(CollectionId collectionId);
   Future<Either<Failure , TodoEntry>>updateToDoEntryStatus(
       {required EntryId entryId, required CollectionId collectionId});



}