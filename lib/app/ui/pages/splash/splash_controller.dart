import 'package:flutter_meedu/meedu.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../routes/routes.dart';

class SplashController extends SimpleNotifier {
  final Permission _locationPermission;
  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._locationPermission);

  Future<void> checkPermission() async {
    final isGranted = await _locationPermission.isGranted;
    _routeName = isGranted ? Routes.HOME : Routes.PERMISSIONS;
    notify();
  }
}
