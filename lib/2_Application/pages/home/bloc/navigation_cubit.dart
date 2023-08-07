import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../1_domain/entities/uniqe_id.dart';


part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationCubitState> {
  NavigationCubit() : super( const NavigationCubitState());

  void selectTodoCollectionChange(CollectionId collectionId)  {
    emit(NavigationCubitState(selectedItemId:collectionId));
  }
void secondBodyHasChanged({required bool isSecondBodyChanged}){
    emit(NavigationCubitState(isSecondBodyIsDisplayed: isSecondBodyChanged ,
        selectedItemId: state.selectedItemId));
}
}
