import 'package:flutter/material.dart';
import 'package:quitanda_getx/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;
  final bool isRemovable;

  const QuantityWidget({
    super.key,
    required this.suffixText,
    required this.value,
    required this.result,
    required this.isRemovable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //BOTÃO REMOVER
          _QuantityWidget(
            icon: !isRemovable ? Icons.remove : Icons.delete_forever,
            color: Colors.grey,
            onPressed: () {
              if (value == 1) return;
              int resultCount = value - 1;
              result(resultCount);
            },
          ),

          //TEXT VALOR E SUFIXO
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Text(
              '$value$suffixText',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //BOTÃO ADICIONAR
          _QuantityWidget(
            icon: Icons.add,
            color: CustomColors.customSwatchColor,
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityWidget({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
