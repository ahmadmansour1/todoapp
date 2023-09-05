part of 'navigation_cubit.dart';

@immutable
 class NavigationCubitState extends Equatable {
  final CollectionId ? selectedItemId;
  final bool ? isSecondBodyIsDisplayed;

  const NavigationCubitState({this.isSecondBodyIsDisplayed, this.selectedItemId});
  @override
  List<Object?> get props => [selectedItemId , isSecondBodyIsDisplayed];
}


