import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/1_domain/entities/todo_collection.dart';
import 'package:todoapp/1_domain/entities/uniqe_id.dart';
import 'package:todoapp/1_domain/repositories/todo_repository.dart';
import 'package:todoapp/2_Application/pages/detail/Bloc/todo_detailed_cubit.dart';
import 'package:todoapp/2_Application/pages/detail/view_state/error_details.dart';
import 'package:todoapp/2_Application/pages/detail/view_state/loaded_details.dart';
import 'package:todoapp/2_Application/pages/detail/view_state/loading_details.dart';

import '../../../../1_domain/usecasses/load_todo_entry_collectionId.dart';
import '../../../core/appcongig.dart';
class TodoDetailedProvider extends StatelessWidget {
  const TodoDetailedProvider({super.key , required this.collectionId});
  final CollectionId collectionId;


  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoDetailedCubit>(create:(context) => TodoDetailedCubit(collectionId:collectionId,
      loadTodoEntryIds: LoadTodoEntryIds(todoRepository:
      RepositoryProvider.of<TodoRepository>(context)),
    )..fetch(),
    child: DetailsPage(collectionId: collectionId,),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.collectionId});

  final CollectionId collectionId;
  static const pageConfig = PageConfig(
    icon: Icons.details_rounded,
    name: 'details',
    child: Placeholder(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoDetailedCubit , TodoDetailedState>(builder: (context, state) {
      if (state is TodoDetailedLoadingState) {
        return const LoadingDetails();
      }
      else if (state is TodoDetailedLoadedState) {
        return LoadedDetailsTodo(
          collectionId: collectionId, entryIds: state.entryId,);
      }
     else {
        return const ErrorDetails();
      }

    });
  }
}
