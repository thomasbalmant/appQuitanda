import 'package:flutter/material.dart';
import 'package:quitanda_getx/src/models/item_model.dart';
import 'package:quitanda_getx/src/services/utils_services.dart';

import '../../../config/custom_colors.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;

  ItemTile({super.key, required this.item});

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
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
              child: Image.asset(item.imgUrl),
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
    );
  }
}
