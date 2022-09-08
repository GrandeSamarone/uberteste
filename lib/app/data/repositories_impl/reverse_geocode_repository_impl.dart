
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import '../../domain/models/place.dart';
import '../../domain/repositories/reverse_geocode_repository.dart';
import '../providers/remote/reverse_geocode_api.dart';

class ReverseGeocodeRepositoryImpl implements ReverseGeocodeRepository {
  final ReverseGeocodeAPI _reverseGeocodeAPI;

  ReverseGeocodeRepositoryImpl(this._reverseGeocodeAPI);
  @override
  void cancel() {
    _reverseGeocodeAPI.cancel();
  }

  @override
  Future<Place?> parse(LatLng at) {
    return _reverseGeocodeAPI.parse(at);
  }
}
