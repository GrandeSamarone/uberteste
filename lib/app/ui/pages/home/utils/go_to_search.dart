import 'package:flutter/material.dart' show WidgetsBinding;
import 'package:flutter_meedu/router.dart' as router;

import '../../search_place/search_place_controller.dart';
import '../../search_place/search_place_page.dart';
import '../home_page.dart';

void goToSearch([bool hasOriginFocus = true]) async {
  final controller = homeProvider.read;
  final state = controller.state;

  final response = await router.push<SearchResponse>(
    const SearchPlacePage(),
    transition: router.Transition.downToUp,
    transitionDuration: const Duration(milliseconds: 200),
    arguments: SearchPlaceArguments(
      initialOrigin: state.origin,
      initialDestination: state.destination,
      hasOriginFocus: hasOriginFocus,
      
    ),
  );
  if (response != null) {
    print("GO TO SEARCH");
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        if (response is OriginAndDestinationResponse) {
          controller.setOriginAndDestination(
            response.origin,
            response.destination,
          );
        } else if (response is PickFromMapResponse) {
          controller.pickFromMap(response.isOrigin);
        }
      },
    );
  }
}
