import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_getx/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda_getx/src/pages/auth/view/components/forgot_password_dialog.dart';
import 'package:quitanda_getx/src/pages/common_widgets/app_name_widget.dart';
import 'package:quitanda_getx/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda_getx/src/config/custom_colors.dart';
import 'package:quitanda_getx/src/pages_routes/app_pages.dart';
import 'package:quitanda_getx/src/services/utils_services.dart';
import 'package:quitanda_getx/src/services/validators.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  //Controladores de texto
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //LOGOTIPO
                    const AppNameWidget(
                      greenTitleColor: Colors.white,
                      textSize: 40,
                    ),
                    //ANIMAÇÃO
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          pause: Duration.zero,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticíneos'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //FORMULARIO
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // EMAIL
                      CustomTextField(
                        controller: emailController,
                        icon: Icons.email,
                        label: 'Email',
                        validator: emailValidator,
                      ),

                      // SENHA
                      CustomTextField(
                        controller: passwordController,
                        isSecret: true,
                        icon: Icons.lock,
                        label: 'Senha',
                        validator: passwordValidator,
                      ),

                      // BOTAO ENTRAR
                      SizedBox(
                        height: 45,
                        child: GetX<AuthController>(
                          builder: (authController) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        String email = emailController.text;
                                        String password =
                                            passwordController.text;
                                        authController.Signin(
                                            email: email, password: password);
                                      }
                                    },
                              child: authController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),

                      // ESQUECEU A SENHA
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () async {
                            final bool? result = await showDialog(
                              context: context,
                              builder: (_) {
                                return ForgotPasswordDialog(
                                    email: emailController.text);
                              },
                            );

                            if (result ?? false) {
                              utilsServices.showToast(
                                  message:
                                      'Um link de recuperação foi enviado para seu email.');
                            }
                          },
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
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
                          onPressed: () {
                            Get.toNamed(PagesRoutes.signUpRoute);
                          },
                          // ignore: sort_child_properties_last
                          child: const Text(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
