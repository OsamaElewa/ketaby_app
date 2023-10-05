import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_styles.dart';
import 'package:ketaby/features/books_view/presentation/cubits/book_cubit.dart';
import 'package:ketaby/features/books_view/presentation/views/book_details.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/book_model.dart';

class BooksListItem extends StatelessWidget {
   BooksListItem({Key? key,required this.products}) : super(key: key);

  Products products;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetails(products: products),)),
      child: Padding(
        padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
        child: Container(
          padding: const EdgeInsets.only(top: 10,left: 20,bottom: 10),
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.indigo)
          ),
          child: Row(
            children: [
              Image(image: NetworkImage(products.image!)),
              const SizedBox(width: 15,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 175,
                           child: Text(products.name!,
                             style: const TextStyle(color: Colors.black,
                                 fontWeight: FontWeight.bold,fontSize: 18),
                             maxLines: 2,overflow: TextOverflow.ellipsis,
                           ),
                        ),
                        const SizedBox(height: 10,),
                        Text(products.category!),
                        const SizedBox(height: 10,),
                        Text(products.price!),
                        const SizedBox(height: 10,),
                        Text('${products.priceAfterDiscount!}',
                          style: AppStyles.textStyle16.copyWith(color: AppColors.indigo),),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: (){
                              BookCubit.get(context).addToFav(productId: '${products.id!}');
                            },
                            icon: Icon(IconBroken.Heart,color: Colors.indigo,)),
                        const Spacer(),
                        IconButton(
                            onPressed: (){
                              BookCubit.get(context).addToCart(productId: '${products.id!}');
                            },
                            icon: Icon(IconBroken.Buy,color: Colors.indigo,)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
