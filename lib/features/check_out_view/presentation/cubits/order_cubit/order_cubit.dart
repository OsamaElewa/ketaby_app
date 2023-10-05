import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../data/models/order_model.dart';
import '../../../data/repository/order_repository/order_repository.dart';
import 'order_state.dart';


class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepository) : super(OrderInitialState());

  final OrderRepository orderRepository;


  static OrderCubit get(context) => BlocProvider.of(context);


  OrderModel? orderModel;

  Future<void> placeOrder({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String address,
}) async {
    emit(OrderLoadingState());
    Either<Failure, OrderModel> result;
    result = await orderRepository.placeOrder(
        id: id,
        name: name,
        email: email,
        phone: phone,
        address: address
    );
    result.fold((failure) {
      print(failure.error);
      print(failure.error);
      emit(OrderFailureState(failure.error));
    }, (orderModel) {
      print(orderModel.message);
      this.orderModel = orderModel;
      emit(OrderSuccessState(orderModel));
    });
  }
}