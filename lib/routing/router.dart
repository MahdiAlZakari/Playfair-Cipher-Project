import 'package:flutter/material.dart';
import 'package:plaincipher/routing/route_name.dart';

import '../Views/home/home_view.dart';
import '../Views/home/widgets/Team/team_view.dart';
import '../Views/home/widgets/AboutPage/about_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute([HomeView()]);
    case TeamRoute:
      return _getPageRoute([TeamView()]);
    case AboutRoute:
      return _getPageRoute([AboutView()]);
    default:
      return _getPageRoute([HomeView()]);
  }
}

PageRoute _getPageRoute(List<Widget> widgets) {
  return _FadeRoute(
    widgets: widgets,
  );
}

class _FadeRoute extends PageRouteBuilder {
  final List<Widget> widgets;
  _FadeRoute({required this.widgets})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              Container(), // You can use a dummy container here since pageBuilder is not used
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Stack(
                  children: [
                    for (int i = 0; i < widgets.length; i++)
                      AnimatedOpacity(
                        opacity: animation.value < (i + 1) / widgets.length
                            ? 0.0
                            : 1.0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child: widgets[i],
                      ),
                  ],
                );
              },
            );
          },
        );
}
