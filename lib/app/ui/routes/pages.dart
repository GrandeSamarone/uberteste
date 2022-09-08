import 'package:flutter/widgets.dart';
import 'package:mapsuberteste/app/ui/pages/request_permission/request_permission_page.dart';
import 'package:mapsuberteste/app/ui/routes/routes.dart';

import '../pages/home/home_page.dart';
import '../pages/splash/splash_page.dart';


Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.HOME: (_) => const HomePage(),
  };
}
