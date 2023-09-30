import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/home/presentation/cubits/slider_cubit/slider_state.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/slider_model.dart';
import '../../../data/repository/category_repository/category_repository.dart';
import '../../../data/repository/slider_repository/slider_repository.dart';
import 'category_state.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepository) : super(CategoryInitialState());

  final CategoryRepository categoryRepository;


  static CategoryCubit get(context) => BlocProvider.of(context);

  CategoryModel? categoryModel;

  Future<void> getCategory() async {
    emit(CategoryLoadingState());
    Either<Failure, CategoryModel> result;
    result = await categoryRepository.getCategories();
    result.fold((failure) {
      emit(CategoryFailureState(failure.error));
    }, (categoryModel) {
      this.categoryModel = categoryModel;
      emit(CategorySuccessState(categoryModel));
    });
  }
}
