import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/widgets/custom_text_field.dart';
import 'package:ketaby/features/books_view/presentation/views/widgets/books_list.dart';

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
          icon: Icon(IconBroken.Arrow___Left_2,color: Colors.indigo,size: 30,),
        ),
        backgroundColor: Colors.transparent,
        title: Text('Books',style: TextStyle(color: Colors.indigo),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                
              },
              icon: Icon(IconBroken.Search,color: Colors.indigo,size: 30,))
        ],
      ),
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          if(state is BookSuccessState){
            return Column(
              children: [
                const BooksList(),
              ],
            );
          }else if(state is BookFailureState){
            return const Text('error');
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
