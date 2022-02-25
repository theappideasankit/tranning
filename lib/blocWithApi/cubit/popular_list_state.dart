part of 'popular_list_cubit.dart';

@immutable
abstract class PopularListState {}

class PopularListInitial extends PopularListState {}

class PopularListLoaded extends PopularListState {
  final List<PopularElement> popular;

  PopularListLoaded({this.popular});
}
