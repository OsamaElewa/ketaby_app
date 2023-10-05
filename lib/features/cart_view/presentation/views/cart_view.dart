import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/api/api_services_implementation.dart';
import 'package:ketaby/features/cart_view/data/repository/cart_repository_implementation.dart';
import 'package:ketaby/features/cart_view/presentation/views/widgets/cart_list.dart';
import 'package:ketaby/features/cart_view/presentation/views/widgets/custom_empty.dart';
import 'package:ketaby/features/check_out_view/presentation/views/check_out_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../config/icons/icons_broken.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../cubits/cart_cubit.dart';
import '../cubits/cart_state.dart';



class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(IconBroken.Arrow___Left_2,color: Colors.indigo,size: 30,),
        ),
        backgroundColor: Colors.transparent,
        title: const Text('Cart',style: TextStyle(color: Colors.indigo),),
        centerTitle: true,
      ),
      body: BlocProvider(
  create: (context) => CartCubit(CartRepositoryImplementation(ApiServicesImplementation()))..getCart(),
  child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if(state is RemoveCartSuccessState){
            showSuccessSnackBar(
                context: context, message: state.removeCartModel.message!);
          }else if (state is RemoveCartFailureState) {
            showSuccessSnackBar(context: context, message: 'the product is deleted successfully');
          }
        },
        builder: (context, state) {
          if(state is CartSuccessState){
            return  ModalProgressHUD(
              inAsyncCall: state is RemoveCartLoadingState || state is UpdateCartLoadingState,
              color: Colors.white,
              opacity: 0.5,
              progressIndicator: const CircularProgressIndicator(),
              child: ConditionalBuilder(
                condition: CartCubit.get(context).cartModel!.data!.cartItems!.isNotEmpty,
                builder: (context) => Column(
                  children: [
                    const CartList(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Total price : ',style: TextStyle(color: Colors.white,fontSize: 17),),
                                Text('${state.cartModel.data!.total!} L.E',style: TextStyle(color: Colors.white,fontSize: 17),)
                              ],
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutView(),));
                                },
                                child: const Text(
                                  'Check Out',
                                  style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 17),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                fallback: (context) => CustomEmpty(title: 'Cart is empty', image: 'assets/images/emptyCart.png'),
              ),
            );
          }else if(state is CartFailureState){
            return const Text('error');
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
),
    );
  }
}
