import 'package:get/get.dart';
import 'package:quitanda_getx/src/constants/storage_keys.dart';
import 'package:quitanda_getx/src/models/user_model.dart';
import 'package:quitanda_getx/src/pages/auth/repository/auth_repository.dart';
import 'package:quitanda_getx/src/pages/auth/result/auth_result.dart';
import 'package:quitanda_getx/src/pages_routes/app_pages.dart';
import 'package:quitanda_getx/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  // Esse trecho faz no momento em que a injeção de dependencia
  // registrar o Authcontroller na memoria
  // o metodo validade token seja chamado
  @override
  void onInit() {
    super.onInit();

    validadeToken();
  }

  Future<void> validadeToken() async {
    //Recuperar token
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    // Zerar o user
    user = UserModel();

    // Remover o token
    await utilsServices.removelLocalData(key: StorageKeys.token);

    // Ir para o login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  void saveTokenAndProceedToBase() {
    //Salvar Token
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);
    //Ir para a base
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> Signin({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    AuthResult result =
        await authRepository.signIn(email: email, password: password);
    isLoading.value = false;
    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
