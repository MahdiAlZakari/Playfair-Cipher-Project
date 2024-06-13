import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.transparent,
          width: 700,
          height: 300,
          child: Column(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Playfair Cipher',
                style: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 75, height: 1.2),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Is a polygraphic substitution cipher that employs a 5x5 grid of letters for encryption, making it more resistant to frequency analysis compared to traditional ciphers. Its strength lies in its use of digraphs, where pairs of letters are encrypted based on their positions within the grid.',
                style: TextStyle(fontSize: 21, height: 1.7),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
