
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import '../../domain/models/route.dart';
import '../../domain/repositories/routes_repository.dart';
import '../providers/remote/routes_api.dart';

class RoutesRepositoryImpl implements RoutesRepository {
  final RoutesAPI _routesAPI;

  RoutesRepositoryImpl(this._routesAPI);
  @override
  Future<List<Route>?> get({
    required LatLng origin,
    required LatLng destination,
  }) {
    return _routesAPI.get(origin: origin, destination: destination);
  }
}
