import 'package:flutter/material.dart';
import 'package:quitanda_getx/src/models/item_model.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;

  const ItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          //IMAGE

          //NOME

          // PREÇO - UNIDADE
        ],
      ),
    );
  }
}
