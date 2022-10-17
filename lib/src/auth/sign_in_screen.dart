import 'package:flutter/material.dart';
import 'package:quitanda_getx/src/components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 40,
            ),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // EMAIL
                const CustomTextField(
                  icon: Icons.email,
                  label: 'Email',
                ),

                // SENHA
                const CustomTextField(
                  isSecret: true,
                  icon: Icons.lock,
                  label: 'Senha',
                ),

                // BOTAO ENTRAR
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                // ESQUECEU A SENHA
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),

                // DIVIDER
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Ou'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                // BOTAO NOVO USUARIO
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Criar Conta',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.green,
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
