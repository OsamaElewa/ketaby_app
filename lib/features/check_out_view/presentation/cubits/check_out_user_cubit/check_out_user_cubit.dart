import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../data/models/check_out_model.dart';
import '../../../data/models/governorates_model.dart';
import '../../../data/repository/check_out_repository/check_out_repository.dart';
import '../../../data/repository/governorates_repository/governorates_repository.dart';
import 'check_out_user_state.dart';


class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit(this.checkOutRepository) : super(CheckOutInitialState());

  final CheckOutRepository checkOutRepository;


  static CheckOutCubit get(context) => BlocProvider.of(context);


  CheckOutModel? checkOutModel;

  Future<void> getCheckOut() async {
    emit(CheckOutUserLoadingState());
    Either<Failure, CheckOutModel> result;
    result = await checkOutRepository.getCheckOut();
    result.fold((failure) {
      print(failure.error);
      emit(CheckOutUserFailureState(failure.error));
    }, (checkOutModel) {
      this.checkOutModel = checkOutModel;
      emit(CheckOutUserSuccessState(checkOutModel));
    });
  }
}
