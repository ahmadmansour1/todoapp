import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class UniqueId with EquatableMixin{

final String value;
const UniqueId._(this.value);

factory UniqueId(){
  return UniqueId._(const Uuid().v4());
}

factory UniqueId.fromUinqueString (String uniqueStr){
return UniqueId._(uniqueStr) ;

}

  @override

  List<Object?> get props => [value];

}
class CollectionId extends UniqueId {
   const CollectionId._(String value ): super._(value);
  factory CollectionId(){
    return CollectionId._(const Uuid().v4());
  }
   factory CollectionId.fromUinqueString (String uniqueStr){
     return CollectionId._(uniqueStr) ;

   }



}

class EntryId extends UniqueId {
  const EntryId._(String value ): super._(value);
  factory EntryId(){
    return EntryId._(const Uuid().v4());
  }
  factory EntryId.fromUinqueString (String uniqueStr){
    return EntryId._(uniqueStr) ;

  }



}