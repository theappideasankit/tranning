import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:day1/blocWithApi/data/modalz/PopularModel.dart';
import 'package:day1/blocWithApi/data/repos.dart';
import 'package:meta/meta.dart';

part 'popular_list_state.dart';

class PopularListCubit extends Cubit<PopularListState> {
  final Repository dashBoardRepository;

  PopularListCubit({this.dashBoardRepository}) : super(PopularListInitial());

   fetchPopList() {
    Timer(const Duration(seconds: 0), () {
      dashBoardRepository.fetchList().then((popular) {
        emit(PopularListLoaded(popular: popular));
      });
    });
  }
}
