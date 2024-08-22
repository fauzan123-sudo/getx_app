import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/common/widget/splash.dart';
import 'package:getx_app/app/data/local/storage_db.dart';
import 'package:getx_app/app/data/model/auth/login_response.dart';
import 'package:getx_app/app/modules/login/controllers/login_controller.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoginController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final StorageDB storageDB = StorageDB();

    return FutureBuilder<LoginResponse?>(
      future: storageDB.readLoginResponse(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else {
          var dataUser = snapshot.data;
          return GetMaterialApp(
            title: "Application",
            debugShowCheckedModeBanner: false,
            initialRoute:
                dataUser == null ? Routes.LOGIN : Routes.BOTTOM_NAVIGATION,
            getPages: AppPages.routes,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              FormBuilderLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('id', 'ID'),
            ],
            locale: const Locale('id', 'ID'),
          );
        }
      },
    );
  }
}
