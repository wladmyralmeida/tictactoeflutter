import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/core/app_fonts.dart';

class PlayGameButton extends StatelessWidget {
  final String buttonName;
  final Function pushDificultyGame;

  const PlayGameButton(
      {Key? key, required this.buttonName, required this.pushDificultyGame})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          pushDificultyGame(),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(25),
            color: Colors.white,
            child: Center(
              child: Text(
                buttonName,
                style: AppFonts.fontblack,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
