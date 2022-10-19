import 'package:flutter/material.dart';
import 'package:quitanda_getx/src/components/custom_text_field.dart';
import 'package:quitanda_getx/src/config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Cadastro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
          ),

          //FORUMULARIO
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 40,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(45),
              ),
            ),
            child: Column(
              children: const [
                CustomTextField(
                  icon: Icons.email,
                  label: 'Email',
                ),
                CustomTextField(
                  icon: Icons.lock,
                  label: 'Senha',
                  isSecret: true,
                ),
                CustomTextField(
                  icon: Icons.person,
                  label: 'Nome',
                ),
                CustomTextField(
                  icon: Icons.phone,
                  label: 'Celular',
                ),
                CustomTextField(
                  icon: Icons.file_copy,
                  label: 'CPF',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
