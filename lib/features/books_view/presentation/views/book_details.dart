import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';
import 'package:ketaby/features/books_view/presentation/cubits/add_to_cubit.dart';
import 'package:ketaby/features/books_view/presentation/cubits/add_to_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/functions/show_snack_bar.dart';
import '../../../cart_view/presentation/cubits/cart_cubit.dart';
import '../../data/models/book_model.dart';

class BookDetails extends StatelessWidget {
   BookDetails({Key? key,required this.products}) : super(key: key);
  Products products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddToCubit, AddToState>(
  listener: (context, state) {
    if(state is AddToFavSuccessState){
      showSuccessSnackBar(
          context: context, message: state.addToFavModel.message!);
    }else if (state is AddToFavFailureState) {
      showErrorSnackBar(context: context, message: state.error);
    }
    if(state is AddToCartSuccessState){
      showSuccessSnackBar(
          context: context, message: state.addToCartModel.message!);
    }else if (state is AddToCartFailureState) {
      showErrorSnackBar(context: context, message: state.error);
    }
  },
  builder: (context, state) {
    return ModalProgressHUD(
      inAsyncCall: state is AddToFavLoadingState || state is AddToCartLoadingState,
      color: Colors.white,
      opacity: 0.5,
      progressIndicator: const CircularProgressIndicator(),
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image(
                    image: NetworkImage(products.image!),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/2,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(IconBroken.Arrow___Left_2)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                            onPressed: (){
                              AddToCubit.get(context).addToFav(productId: '${products.id!}');
                            },
                            icon: Icon(IconBroken.Heart)),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 300,
                        child: Text(
                          products.name!,
                          style: const TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                          maxLines: 2,overflow: TextOverflow.ellipsis,)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(products.category!,style: TextStyle(color: Colors.grey,fontSize: 18),),
                        Column(
                          children: [
                            Text(
                              '${products.price!}  L.E',
                              style: TextStyle(decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,fontSize: 15),),
                            Text(
                              '${products.price!}  L.E',
                              style: TextStyle(color: Colors.indigo,fontSize: 15,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text('Description',style: TextStyle(color: Colors.black,fontSize: 18),),
                    const SizedBox(height: 10,),
                    Text(products.description!,style: TextStyle(color: Colors.grey,fontSize: 18),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
                child: GradientButton(
                    onPressed: (){
                      AddToCubit.get(context).addToCart(productId: '${products.id!}').then((value) {
                        CartCubit.get(context).getCart();
                      });
                    },
                    title: Text('Add to cart')),
              )
            ],
          ),
        ),
    );
  },
),
    );
  }
}
