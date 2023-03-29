import 'package:flutter/material.dart';
import 'package:quitanda_getx/src/models/cart_item_model.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;

  const CartTile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //Image
        leading: Image.asset(cartItem.item.imgUrl),

        //Titulo

        //Total

        //Quantidade
      ),
    );
  }
}
