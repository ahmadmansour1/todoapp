import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/0_data/repositries/todo_repo_mock.dart';
import 'package:todoapp/1_domain/repositories/todo_repository.dart';
import 'package:todoapp/2_Application/app/basic_app.dart';

void main() {
  runApp(RepositoryProvider<TodoRepository>(create:(context) =>TodoRepoMock(),
      child: const BasicApp()));
}

