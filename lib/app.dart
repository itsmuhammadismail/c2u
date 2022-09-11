import 'package:c2u/features/user/presentation/screens/splash/splash_screen.dart';
import 'package:c2u/shared/route_aware/route_observer.dart';
import 'package:c2u/shared/routes/routes.dart';
import 'package:c2u/shared/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'C2U',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
      initialRoute: SplashScreen.id,
      routes: Routes.routes,
      navigatorObservers: [routeObserver],
    );
  }
}
