part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryListLoaded extends CategoryState {
  final List<CategoryElement> category;

  CategoryListLoaded({this.category});
}