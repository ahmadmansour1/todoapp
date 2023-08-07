import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/1_domain/entities/uniqe_id.dart';
import 'package:todoapp/1_domain/repositories/todo_repository.dart';
import 'package:todoapp/1_domain/usecasses/load_overview_entry.dart';
import 'package:todoapp/2_Application/pages/todoEntryItem/viewState/errorTodoEntryItem.dart';
import 'package:todoapp/2_Application/pages/todoEntryItem/viewState/loadedTodoEntryItem.dart';
import 'package:todoapp/2_Application/pages/todoEntryItem/viewState/loadingTodoEntryItem.dart';

import '../../../1_domain/entities/todo_entry.dart';
import '../../../1_domain/usecasses/load_todo_entry_item.dart';
import 'cubit/todo_entry_item_cubit.dart';

class TodoEntryProvider extends StatelessWidget {
  const TodoEntryProvider({Key? key,required this.collectionId, required this.entryId}) : super(key: key);
  final CollectionId collectionId ;
  final EntryId entryId ;



  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoEntryItemCubit>(
      create: (context) => TodoEntryItemCubit( collectionId:collectionId  ,
          entryId:entryId ,

          loadTodoEntry: LoadTodoEntry(
            todoRepository: RepositoryProvider.of<TodoRepository>(context),
          ),
          updateToDoEntryStatus: UpdateToDoEntryStatus(
            todoRepository: RepositoryProvider.of<TodoRepository>(context),
          ))..fetch(),
      child: const TodoEntryItem(),
    );
  }
}


class TodoEntryItem extends StatelessWidget {
  const TodoEntryItem({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoEntryItemCubit , TodoEntryItemState >(
        builder:(context , state){
      if(state is TodoEntryItemLoadingState){
        return const LoadingTodoEntryItem();
      }
      else if (state is TodoEntryItemLoadedState){
        return LoadedTodoEntryItem(entryItem: state.todoEntry,
          onChange: (value) => context.read<TodoEntryItemCubit>().update());
      }
      else {
        return const ErrorTodoEntryItem();
      }
    });


  }
}
