import 'package:flutter/material.dart';
import 'package:quitanda_getx/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  const OrderStatusWidget({
    super.key,
    required this.isOverdue,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;

  const _StatusDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color:
                isActive ? CustomColors.customSwatchColor : Colors.transparent,
          ),
          child: isActive ? const Icon(Icons.check) : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
