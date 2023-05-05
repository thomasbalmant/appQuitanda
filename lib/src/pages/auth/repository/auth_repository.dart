import 'package:quitanda_getx/src/constants/endpoints.dart';
import 'package:quitanda_getx/src/models/user_model.dart';
import 'package:quitanda_getx/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      print('Signin functionou');
      final user = UserModel.fromJson(result['result']);
      print(user);
    } else {
      print('Signin não functionou');
    }
  }
}
