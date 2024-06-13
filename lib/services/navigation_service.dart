import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }

  Future<bool?> goBack() async {
    final currentState = navigatorKey.currentState;
    if (currentState != null && currentState.canPop()) {
      currentState.pop();
      return true; // Indicate that navigation back was successful
    }
    return false; // Indicate that navigation back was not possible
  }
}
