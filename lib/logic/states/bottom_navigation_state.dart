part of '../bloc/bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChanged({required this.currentIndex});

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

// class FirstPageLoaded extends BottomNavigationState {
//   final String text;
//
//   FirstPageLoaded({@required this.text});
//
//   @override
//   String toString() => 'FirstPageLoaded with text: $text';
// }

class HomePageLoaded extends BottomNavigationState {
  final CategoriesModel data;

  HomePageLoaded({required this.data});

  @override
  String toString() => 'SecondPageLoaded with number: $data';
}

class ProfilePageLoaded extends BottomNavigationState {
  // final User data;
  //
  // ProfilePageLoaded({@required this.data});
  //
  // @override
  // String toString() => 'SecondPageLoaded with number: $data';
}
