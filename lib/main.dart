import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quitanda_getx/src/pages/splash/splash_screen.dart';
import 'package:quitanda_getx/src/pages_routes/app_pages.dart';

import 'src/pages/auth/sign_in_screen.dart';

void main() {
  // Trecho de código que garante que todos os componentes necessários para a ação seguinte já estejam iniciados
  WidgetsFlutterBinding.ensureInitialized();

  // Mais abaixo teremos o método assíncrono que define as possíveis orientações suportadas pelo app.
  // Nesta lista abaixo você tem todas estas orientações disponíveis:
  /*
    * DeviceOrientation.landscapeRight,
    * DeviceOrientation.landscapeLeft,
    * DeviceOrientation.portraitUp, 
    * DeviceOrientation.portraitDown,
 */

  // Aqui definimos apenas o modo retrato em pé, fazendo com que todo nosso app fique apenas nessa orientação, evitando o overflow
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Greengrocer',
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white.withAlpha(190)),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
