import 'package:flutter/material.dart';
import 'package:plaincipher/Views/home/widgets/Centered_view/Centered_view.dart';
import 'package:plaincipher/Views/home/widgets/navigation_bar/navigation_bar.dart';
import 'package:plaincipher/locator.dart';
import 'package:plaincipher/routing/route_name.dart';
import 'package:plaincipher/routing/router.dart';
import 'package:plaincipher/services/navigation_service.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
          child: Column(
        children: [
          TNavigationBar(),
          Expanded(
            child: Navigator(
              key: locator<NavigationService>().navigatorKey,
              onGenerateRoute: generateRoute,
              initialRoute: HomeRoute,
            ),
          ),
        ],
      )),
    );
  }
}
