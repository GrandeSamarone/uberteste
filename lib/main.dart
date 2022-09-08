import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'app/ui/routes/pages.dart';
import 'app/ui/routes/routes.dart';
import 'inject_dependencies.dart';

void main() {
  injectDependencies();
  router.setDefaultTransition(router.Transition.fadeIn);
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      navigatorKey: router.navigatorKey,
      navigatorObservers: [
        router.observer,
      ],
      routes: appRoutes,
    );
  }
}
