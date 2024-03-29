import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_getx/src/pages/common_widgets/app_name_widget.dart';
import 'package:quitanda_getx/src/pages_routes/app_pages.dart';

import '../../config/custom_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.customSwatchColor,
              CustomColors.customSwatchColor.shade700,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            AppNameWidget(
              greenTitleColor: Colors.white,
              textSize: 40,
            ),
            SizedBox(height: 13),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
