import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/1_domain/usecasses/load-overview.dart';
import 'package:todoapp/2_Application/bloc/todo_overview__cubit.dart';
import 'package:todoapp/2_Application/pages/overview/view_states/error_overview.dart';
import 'package:todoapp/2_Application/pages/overview/view_states/loaded_overview.dart';
import 'package:todoapp/2_Application/pages/overview/view_states/loading_overiew.dart';

import '../../core/appcongig.dart';



class TodoOverviewProvider extends StatelessWidget {
  const TodoOverviewProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context) => TodoOverviewCubit(
        loadToDoCollections:LoadToDoCollections(
            toDoRepository: RepositoryProvider.of(context)))..readOverviewCollections(),
    child: const OverviewPage(),
    );

  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});
  static   const pageConfig = PageConfig(
    icon: Icons.work_history_rounded,
    name: 'overview',
    child: TodoOverviewProvider(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
    child: BlocBuilder<TodoOverviewCubit, TodoOverviewState>(
      builder:(context , state) {
      if(state is TodoOverviewLoaded){
        return LoadedOverview(collection: state.collections);
      }
      else if(state is TodoOverviewErrorState){
        return const ErrorOverview();
      }
      else return const LoadingOverview();

    },

    ),
    );


  }
}
