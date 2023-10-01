import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/widgets/gradient_button.dart';

import '../../data/models/book_model.dart';

class BookDetails extends StatelessWidget {
   BookDetails({Key? key,required this.products}) : super(key: key);
  Products products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          onPressed: () => Navigator.pop(context),
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
                  onPressed: (){},
                  title: 'Add to cart'),
            )
          ],
        ),
      ),
    );
  }
}
