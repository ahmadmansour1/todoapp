import 'package:flutter/material.dart';

import '../../../../1_domain/entities/uniqe_id.dart';
import '../../todoEntryItem/todoEntryItem.dart';

class LoadedDetailsTodo extends StatelessWidget {
  const LoadedDetailsTodo({Key? key , required this.collectionId , required this.entryIds}) : super(key: key);

  final List<EntryId> entryIds;
  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(itemCount: entryIds.length,itemBuilder:
              (context , index) {
             return TodoEntryProvider(collectionId: collectionId, entryId: entryIds[index],);
          }),
        )
    );
  }
}
