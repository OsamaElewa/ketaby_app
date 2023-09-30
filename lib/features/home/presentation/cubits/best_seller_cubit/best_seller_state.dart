
import '../../../data/models/best_seller_model.dart';
import '../../../data/models/slider_model.dart';

abstract class BestSellerState {}

class BestSellerInitialState extends BestSellerState {}

class BestSellerLoadingState extends BestSellerState {}

class BestSellerSuccessState extends BestSellerState {
  final BestSellerModel bestSellerModel;

  BestSellerSuccessState(this.bestSellerModel);
}

class BestSellerFailureState extends BestSellerState {
  final String error;

  BestSellerFailureState(this.error);
}
