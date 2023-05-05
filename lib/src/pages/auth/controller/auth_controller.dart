import 'package:get/get.dart';
import 'package:quitanda_getx/src/pages/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();

  Future<void> Signin({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    await authRepository.signIn(email: email, password: password);
    isLoading.value = false;
  }
}
