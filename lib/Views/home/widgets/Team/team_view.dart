import 'package:flutter/material.dart';
import 'package:plaincipher/Views/home/widgets/Team/widgets/card.dart';

class TeamView extends StatefulWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  late List<MemberCard> cardsData;
  List<MemberCard> memberCards = [];
  bool isAnimationComplete = false;

  @override
  void initState() {
    super.initState();
    cardsData = [
      MemberCard(
        name: "Abdulrhman Albusaad",
        workDescription: "Web page",
      ),
      MemberCard(
        name: "",
        workDescription: "",
      ),
      MemberCard(
        name: "",
        workDescription: "",
      ),
      MemberCard(
        name: "",
        workDescription: "",
      ),
    ];
    _buildMemberCardsWithDelay(0);
  }

  void _buildMemberCardsWithDelay(int index) {
    if (index >= cardsData.length) {
      setState(() {
        isAnimationComplete = true;
      });
      return;
    }

    Future.delayed(Duration(milliseconds: 150), () {
      setState(() {
        memberCards.add(cardsData[index]);
      });
      _buildMemberCardsWithDelay(index + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          children: [
            for (int i = 0; i < memberCards.length; i++)
              AnimatedOpacity(
                opacity: isAnimationComplete ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: memberCards[i],
              ),
          ],
        ),
      ),
    );
  }
}
