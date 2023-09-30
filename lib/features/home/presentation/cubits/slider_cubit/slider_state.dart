
import '../../../data/models/slider_model.dart';

abstract class SliderState {}

class SliderInitialState extends SliderState {}

class SliderLoadingState extends SliderState {}

class SliderSuccessState extends SliderState {
  final SliderModel sliderModel;

  SliderSuccessState(this.sliderModel);
}

class SliderFailureState extends SliderState {
  final String error;

  SliderFailureState(this.error);
}
