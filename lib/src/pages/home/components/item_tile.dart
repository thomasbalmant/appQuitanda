import 'package:flutter/material.dart';
import 'package:quitanda_getx/src/models/item_model.dart';
import 'package:quitanda_getx/src/pages/product/product_screen.dart';
import 'package:quitanda_getx/src/services/utils_services.dart';

import '../../../config/custom_colors.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;
  final GlobalKey imageGk = GlobalKey();

  ItemTile({
    super.key,
    required this.item,
    required this.cartAnimationMethod,
  });

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // CONTEUDO
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (c) {
                return ProductScreen(item: item);
              }),
            );
          },
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //IMAGE
                  Expanded(
                    child: Hero(
                      tag: item.imgUrl,
                      child: Image.asset(
                        item.imgUrl,
                        key: imageGk,
                      ),
                    ),
                  ),

                  //NOME
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // PREÇO - UNIDADE
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        '/${item.unit}',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //BOTÃO DE ADICIONAR NO CARRINHO
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              cartAnimationMethod(imageGk);
            },
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                  color: CustomColors.customSwatchColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(20),
                  )),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
