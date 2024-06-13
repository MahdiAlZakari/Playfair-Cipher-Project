import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plaincipher/Views/home/widgets/Centered_view/Centered_view.dart';
import 'package:plaincipher/Views/home/widgets/Home/home.dart';
import 'package:plaincipher/Views/home/widgets/EnterPage/enter_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _scrollController;
  bool _showUpButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final direction = _scrollController.position.userScrollDirection;
    setState(() {
      _showUpButton = direction == ScrollDirection.reverse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        controller: _scrollController,
        children: [
          CenteredView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Playfair text first-page
                Expanded(child: CourseDetails()),

                SizedBox(width: 20),

                // image
                Image.asset(
                  'assets/12.png',
                  color: Colors.transparent,
                  fit: BoxFit.contain,
                  width: 350,
                ),
              ],
            ),
          ),

          // Scroll down
          Visibility(
            visible: !_showUpButton,
            child: IconButton(
              icon: Icon(Icons.arrow_downward, size: 40),
              onPressed: () {
                _scrollController.animateTo(
                  _scrollController.position.viewportDimension,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeOut,
                );
              },
            ),
          ),

          // Enter Second-page
          CenteredView(
            child: Expanded(child: EnterPage()),
          ),

          // Scroll up
          Visibility(
            visible: _showUpButton,
            child: IconButton(
              icon: Icon(Icons.arrow_upward, size: 40),
              onPressed: () {
                _scrollController.animateTo(
                  _scrollController.position.minScrollExtent,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
