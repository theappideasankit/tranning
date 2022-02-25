import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:day1/blocWithApi/data/modalz/catModel.dart';
import 'package:day1/blocWithApi/data/repos.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final Repository dashBoardRepository;

  CategoryCubit({this.dashBoardRepository}) : super(CategoryInitial());

  void fetchCategoryList() {
    Timer(const Duration(seconds: 0), () {
      dashBoardRepository.fetchCategory().then((category) {
        emit(CategoryListLoaded(category: category));
      });
    });
  }
}
