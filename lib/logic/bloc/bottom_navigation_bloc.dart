import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/categories_model.dart';
import '../../repositories/category_repository.dart';

part '../events/bottom_navigation_event.dart';
part '../states/bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc({required this.categoriesRepository})
      : assert(categoriesRepository != null),
        super(PageLoading());

  final CategoriesRepository categoriesRepository;
  int currentIndex = 0;

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();
      if (this.currentIndex == 0) {
        CategoriesModel data = await _getHomeCategoryData();
        yield HomePageLoaded(data: data);
      }
      if (this.currentIndex == 1) {
        // String data = await _getFirstPageData();
        // yield FirstPageLoaded(text: data);
      }
      if (this.currentIndex == 2) {
        // User data = await _getProfileData();
        // yield ProfilePageLoaded(data: data);
      }
    }
  }

  // Future<String> _getFirstPageData() async {
  //   // String data = firstPageRepository.data;
  //   // if (data == null) {
  //   //   await firstPageRepository.fetchData();
  //   //   data = firstPageRepository.data;
  //   // }
  //   // return data;
  // }

  // Future<CategoriesModel> _getSecondPageData() async {
  //   // CategoryModel data = secondPageRepository.data;
  //   // if (data == null) {
  //   //   await secondPageRepository.fetchData();
  //   //   data = secondPageRepository.data;
  //   // }
  //   // return data;
  // }

  Future<CategoriesModel> _getHomeCategoryData() async {
    CategoriesModel data = categoriesRepository.data;
    if (data == null) {
      await categoriesRepository.fetchData();
      data = categoriesRepository.data;
    }
    return data;
  }
  //
  // Future<User> _getProfileData() async {
  //   User data = profilePageRepository.data;
  //   if (data == null) {
  //     await profilePageRepository.fetchData();
  //     data = profilePageRepository.data;
  //   }
  //   return data;
  // }
}
