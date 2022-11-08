import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../config/custom_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Badge(
            badgeColor: CustomColors.customContrastColor,
            badgeContent: const Text('2'),
            child: Icon(
              Icons.shopping_cart,
              color: CustomColors.customSwatchColor,
            ),
          ),
        ],
      ),

      // Campo pesquisa

      // Categorias

      // Grid
    );
  }
}
