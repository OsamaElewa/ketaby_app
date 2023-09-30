import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/home/presentation/cubits/slider_cubit/slider_state.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/slider_model.dart';
import '../../../data/repository/slider_repository/slider_repository.dart';


class SliderCubit extends Cubit<SliderState> {
  SliderCubit(this.sliderRepository) : super(SliderInitialState());

  final SliderRepository sliderRepository;


  static SliderCubit get(context) => BlocProvider.of(context);

  SliderModel? sliderModel;

  Future<void> getSlider() async {
    emit(SliderLoadingState());
    Either<Failure, SliderModel> result;
    result = await sliderRepository.getSlider();
    result.fold((failure) {
      emit(SliderFailureState(failure.error));
    }, (sliderModel) {
      this.sliderModel = sliderModel;
      emit(SliderSuccessState(sliderModel));
    });
  }
}
