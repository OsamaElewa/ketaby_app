import '../../../data/models/check_out_model.dart';

abstract class CheckOutState {}

class CheckOutInitialState extends CheckOutState {}

class CheckOutUserLoadingState extends  CheckOutState {}
class CheckOutUserSuccessState extends  CheckOutState {
  final CheckOutModel checkOutModel;

 CheckOutUserSuccessState(this.checkOutModel);
}

class CheckOutUserFailureState extends CheckOutState {
  final String error;

  CheckOutUserFailureState(this.error);
}
