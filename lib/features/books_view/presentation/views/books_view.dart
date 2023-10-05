import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/features/books_view/presentation/views/widgets/books_list.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/functions/show_snack_bar.dart';
import '../cubits/book_cubit.dart';
import '../cubits/book_state.dart';

class BooksView extends StatelessWidget {
   BooksView({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(IconBroken.Arrow___Left_2,color: Colors.indigo,size: 30,),
        ),
        backgroundColor: Colors.transparent,
        title: const Text('Books',style: TextStyle(color: Colors.indigo),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                
              },
              icon: const Icon(IconBroken.Search,color: Colors.indigo,size: 30,))
        ],
      ),
      body: BlocConsumer<BookCubit, BookState>(
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
          return ConditionalBuilder(
            condition: BookCubit.get(context).bookModel != null,
            builder: (context) => ModalProgressHUD(
              inAsyncCall: state is AddToFavLoadingState || state is AddToCartLoadingState,
              color: Colors.white,
              opacity: 0.5,
              progressIndicator: const CircularProgressIndicator(),
              child: const Column(
                children: [
                  BooksList(),
                ],
              ),
            ),
            fallback:(context) => const Center(child: CircularProgressIndicator(),),
          );
        },
      ),
    );
  }
}
