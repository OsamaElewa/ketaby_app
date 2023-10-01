import 'package:flutter/cupertino.dart';
import 'package:ketaby/features/books_view/presentation/views/widgets/books_list_item.dart';

import '../../cubits/book_cubit.dart';

class BooksList extends StatelessWidget {
  const BooksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) =>  BooksListItem(products: BookCubit.get(context).bookModel!.data!.products![index],),
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
          itemCount: BookCubit.get(context).bookModel!.data!.products!.length
      ),
    );
  }
}
