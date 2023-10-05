import 'package:flutter/cupertino.dart';

import '../../../data/models/check_out_model.dart';

class CheckOutItem extends StatelessWidget {
  const CheckOutItem({Key? key, required this.cartItems}) : super(key: key);

  final CartItems cartItems;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(cartItems.itemProductName!),
            Row(
              children: [
                const Text('Quantity'),
                Text('${cartItems.itemQuantity!}'),
                
              ],
            ),
          ],
        ),
        Text(cartItems.itemProductPrice!),
      ],
    );
  }
}
