import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/1_domain/entities/todo_color.dart';


import '../../../1_domain/repositories/todo_repository.dart';
import '../../../1_domain/usecasses/create_todo_collection.dart';
import '../../core/appcongig.dart';
import 'bloc/create_todo_collection_cubit.dart';

class CreateToDoCollectionPageProvider extends StatelessWidget {
  const CreateToDoCollectionPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTodoCollectionCubit>(
      create: (context) => CreateTodoCollectionCubit(createTodoCollection: CreateTodoCollection(
        todoRepository: RepositoryProvider.of<TodoRepository>(context),
      )
      )..createTodoCollection,
      child: const CreateToDoCollectionPage(),
    );
  }
}

class CreateToDoCollectionPage extends StatefulWidget {
  const CreateToDoCollectionPage({super.key});

  static const pageConfig = PageConfig(
    name: 'create_todo_collection',
    icon: Icons.add_task_rounded,
    child: CreateToDoCollectionPageProvider(),
  );

  @override
  State<CreateToDoCollectionPage> createState() => _CreateToDoCollectionPageState();
}

class _CreateToDoCollectionPageState extends State<CreateToDoCollectionPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
               onChanged: (value) => context.read<CreateTodoCollectionCubit>().titleChanged(value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title!';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Color'),
             onChanged: (value) => context.read<CreateTodoCollectionCubit>().colorChanged(value),
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  final parsedColorIndex = int.tryParse(value);
                  if (parsedColorIndex == null ||
                      parsedColorIndex < 0 ||
                      parsedColorIndex > TodoColor.preDefinedColors.length) {
                    return 'Only numbers between 0 and ${TodoColor.preDefinedColors.length - 1} are allowed';
                  }
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                final isValide = _formKey.currentState?.validate();
                if (isValide == true) {
                  context.read<CreateTodoCollectionCubit>().submit();
                  context.pop();
                }
              },
              child: const Text('Save Collection'),
            ),
          ],
        ),
      ),
    );
  }
}