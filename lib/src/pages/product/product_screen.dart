import 'package:flutter/material.dart';
import 'package:quitanda_getx/src/models/item_model.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key, required this.item});

  ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(item.imgUrl),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(0, 2),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
