import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/1_domain/entities/todo_collection.dart';
import 'package:todoapp/2_Application/pages/create_todo_collection/create_todo_collection_page.dart';
import 'package:todoapp/2_Application/pages/detail/widget/detail_page.dart';
import 'package:todoapp/2_Application/pages/home/bloc/navigation_cubit.dart';


class LoadedOverview extends StatelessWidget {
  const LoadedOverview({Key? key, required this.collection}) : super(key: key);

  final List<TodoCollection> collection;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationCubitState>(
      buildWhen: (previous , current) => previous.selectedItemId != current.selectedItemId,
      builder: (context, state) {
        return Stack(
          children:[
            ListView.builder(
              itemCount: collection.length, itemBuilder: (context, index) {
            final colorScheme = Theme
                .of(context)
                .colorScheme;

            final item = collection[index];
            return ListTile(
              tileColor: colorScheme.surface,
              selectedTileColor: colorScheme.surfaceVariant,
              iconColor: item.todoColor.colors,
              selectedColor: item.todoColor.colors,
              selected: state.selectedItemId== item.id,
              onTap: () {
                context.read<NavigationCubit>().selectTodoCollectionChange(
                    item.id);


                if (Breakpoints.small.isActive(context)) {
                  context.pushNamed(DetailsPage.pageConfig.name, pathParameters: {
                    'collectionId': item.id.value,
                  });
                }
              },
              leading: const Icon(Icons.circle),
              title: Text(item.title),


            );

          }),
            Align(alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              child: Icon(CreateToDoCollectionPage.pageConfig.icon),
              onPressed: () => context.pushNamed(CreateToDoCollectionPage.pageConfig.name),
            ),
            ),

        ]
        );
      },
    );
  }
}
