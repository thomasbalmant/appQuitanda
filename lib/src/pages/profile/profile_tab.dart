import 'package:flutter/material.dart';
import 'package:quitanda_getx/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda_getx/src/config/app_data.dart' as appData;

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil do Usuário'), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.logout),
        ),
      ]),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          // Email
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.email,
            icon: Icons.email,
            label: 'Email',
          ),

          // Nome
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.name,
            icon: Icons.person,
            label: 'Nome',
          ),

          // Celular
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.phone,
            icon: Icons.phone,
            label: 'Celular',
          ),

          // CPF
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),

          // Senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.green,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: const Text('Atualizar senha'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
