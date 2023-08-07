import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp/1_domain/entities/uniqe_id.dart';


import 'package:todoapp/1_domain/failures/failure.dart';
abstract class UseCase<Type , Params>  {
  Future<Either<Failure , Type>> call(Params params);

}

abstract class Params extends Equatable{

}
class NoParams extends Params {
  @override
  List<Object?> get props => [];
}
class TodoEntryIdsParams extends Params {
  final EntryId entryId ;
  final CollectionId collectionId;
  TodoEntryIdsParams({required this.entryId, required this.collectionId});
  @override
  List<Object?> get props => [collectionId , entryId];


}

class CollectionIdParams extends Params {

  final CollectionId collectionId;
  CollectionIdParams( {required this.collectionId});
  @override
  List<Object?> get props => [collectionId];


}

