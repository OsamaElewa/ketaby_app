import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/features/books_view/presentation/cubits/add_to_cubit.dart';
import 'package:ketaby/features/books_view/presentation/cubits/add_to_state.dart';
import 'package:ketaby/features/books_view/presentation/views/widgets/modal_progress_loading.dart';

import '../../../../../core/functions/show_snack_bar.dart';
import 'books_list.dart';

class BooksViewBody extends StatelessWidget {
  const BooksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToCubit, AddToState>(
      listener: (context, state) {
        if(state is AddToFavSuccessState){
          showSuccessSnackBar(
              context: context, message: state.addToFavModel.message!);
        }else if (state is AddToFavFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }

        else if(state is AddToCartSuccessState){
          showSuccessSnackBar(
              context: context, message: state.addToCartModel.message!);
        }else if (state is AddToCartFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return const ModalProgressLoading();
      },
    );
  }
}
