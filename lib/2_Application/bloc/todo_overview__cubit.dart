import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/1_domain/usecasses/load-overview.dart';


import '../../1_domain/entities/todo_collection.dart';
import '../core/usecase.dart';

part 'todo_overview__state.dart';

class TodoOverviewCubit extends Cubit<TodoOverviewState> {
  TodoOverviewCubit({required this.loadToDoCollections})
      : super(TodoOverviewInitial());
  final LoadToDoCollections loadToDoCollections;

  Future<void> readOverviewCollections() async {
    emit(TodoOverviewLoading());
    try {
      final collectionEither = await loadToDoCollections.call(NoParams());
      collectionEither.fold(
              (failure) => emit(TodoOverviewErrorState()),
      (collections) => emit(TodoOverviewLoaded(collections: collections)));
    }

on Exception{
      emit(TodoOverviewErrorState());
    }
  }


}
