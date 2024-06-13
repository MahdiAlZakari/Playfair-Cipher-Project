import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    super.key,
    required this.name,
    required this.workDescription,
  });

  final String name;
  final String workDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 300,
        width: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _infoContainer(context: context),
          ],
        ),
      ),
    );
  }

  Container _infoContainer({required BuildContext context}) {
    return Container(
      width: 250,
      height: 300,
      decoration: _boxDecoration(),
      child: Stack(
        children: [
          Center(
            child: ListTile(
              title: Text(
                name,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                workDescription,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      boxShadow: _boxShadow,
    );
  }

  List<BoxShadow> get _boxShadow {
    return [
      BoxShadow(
        color: Colors.grey.withOpacity(.3),
        offset: Offset(0, 2),
        blurRadius: 17,
        blurStyle: BlurStyle.outer,
        spreadRadius: 7,
      ),
    ];
  }
}
