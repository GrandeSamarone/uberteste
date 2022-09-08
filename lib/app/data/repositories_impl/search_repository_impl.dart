
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import '../../domain/models/place.dart';
import '../../domain/repositories/search_repository.dart';
import '../providers/remote/search_api.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchAPI _searchAPI;

  SearchRepositoryImpl(this._searchAPI);

  @override
  void search(String query, LatLng at) {
    _searchAPI.search(query, at);
  }

  @override
  void cancel() {
    _searchAPI.cancel();
  }

  @override
  void dispose() {
    _searchAPI.dispose();
  }

  @override
  Stream<List<Place>?> get onResults => _searchAPI.onResults;
}
