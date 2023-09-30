
import '../../../data/models/category_model.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategorySuccessState extends CategoryState {
  final CategoryModel categoryModel;

CategorySuccessState(this.categoryModel);
}

class CategoryFailureState extends CategoryState {
final String error;

CategoryFailureState(this.error);
}
