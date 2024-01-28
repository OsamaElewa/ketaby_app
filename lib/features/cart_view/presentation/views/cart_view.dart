import 'package:flutter/material.dart';

import 'package:ketaby/features/cart_view/presentation/views/widgets/cart_list.dart';


import '../../../../config/icons/icons_broken.dart';




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
      body: const CartList(),
    );
  }
}
