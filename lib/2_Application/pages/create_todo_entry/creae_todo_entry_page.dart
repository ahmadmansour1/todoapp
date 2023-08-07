import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/2_Application/core/appcongig.dart';
class CreateTodoPageProvider extends StatelessWidget {
  const CreateTodoPageProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CreateTodoEntryPage();
  }
}

class CreateTodoEntryPage extends StatelessWidget {
  const CreateTodoEntryPage({Key? key}) : super(key: key);
  static   const pageConfig = PageConfig(
    icon: Icons.add_task_rounded,
    name: 'Create_ToDo_Collection',
    child: CreateTodoEntryPage(),
  );

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(0.8),
    child: Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Desciption'
            ),
            onChanged: (value) {
              //
            },


          )

        ],
      ),
    ),
    );
  }
}
