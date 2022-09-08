import 'package:dio/dio.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';
import 'app/data/navite_code/brackground_location.dart';
import 'app/data/providers/local/geolocator_wrapper.dart';
import 'app/data/providers/remote/reverse_geocode_api.dart';
import 'app/data/providers/remote/routes_api.dart';
import 'app/data/providers/remote/search_api.dart';
import 'app/data/repositories_impl/brackground_location_repository_impl.dart';
import 'app/data/repositories_impl/reverse_geocode_repository_impl.dart';
import 'app/data/repositories_impl/routes_repository_impl.dart';
import 'app/data/repositories_impl/search_repository_impl.dart';
import 'app/domain/repositories/brackground_location_repository.dart';
import 'app/domain/repositories/reverse_geocode_repository.dart';
import 'app/domain/repositories/routes_repository.dart';
import 'app/domain/repositories/search_repository.dart';

void injectDependencies() {
  final dio = Dio();
  Get.i.lazyPut<GeolocatorWrapper>(
    () => GeolocatorWrapper(),
  );

  Get.i.lazyPut<ReverseGeocodeRepository>(
    () => ReverseGeocodeRepositoryImpl(
      ReverseGeocodeAPI(dio),
    ),
  );

  Get.i.lazyPut<RoutesRepository>(
    () => RoutesRepositoryImpl(
      RoutesAPI(dio),
    ),
  );

  Get.i.lazyPut<SearchRepository>(
    () => SearchRepositoryImpl(
      SearchAPI(dio),
    ),
  );

  Get.i.lazyPut<BackgroundLocationRepository>(
    () => BackgroundLocationRepositoryImpl(
      BackgroundLocation(),
    ),
  );
}
