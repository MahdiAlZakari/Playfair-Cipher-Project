import 'package:flutter/material.dart';
import 'package:plaincipher/routing/route_name.dart';
import 'package:plaincipher/services/navigation_service.dart';
import 'package:plaincipher/locator.dart'; // Assuming this is the correct import for locator

class TNavigationBar extends StatelessWidget {
  const TNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _NavBarItem(title: 'Home', navigationPath: HomeRoute),
                SizedBox(width: 60),
                _NavBarItem(title: 'Team', navigationPath: TeamRoute),
                SizedBox(width: 60),
                _NavBarItem(title: 'About', navigationPath: AboutRoute),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;

  const _NavBarItem({required this.title, required this.navigationPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(navigationPath);
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
