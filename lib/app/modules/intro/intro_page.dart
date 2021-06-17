import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/core/app_colors.dart';
import 'package:tic_tac_toe/app/core/app_constants.dart';
import 'package:tic_tac_toe/app/core/app_fonts.dart';
import 'package:tic_tac_toe/app/modules/home/home_page.dart';
import 'package:tic_tac_toe/app/widgets/play_game_button.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Container(
                  child: Text(
                    AppConstants.jogoDaVelha,
                    style: AppFonts.fontWhite.copyWith(fontSize: 22),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: AvatarGlow(
                  endRadius: 140,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 1),
                  startDelay: Duration(seconds: 1),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.none,
                        ),
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[900],
                      child: Container(
                        child: Image.asset(
                          'assets/images/jogodavelha.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      radius: 80.0,
                    ),
                  ),
                ),
              ),
            ),
            PlayGameButton(
              buttonName: AppConstants.jogar + " " + AppConstants.facil,
              pushDificultyGame: () => MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ),
            PlayGameButton(
              buttonName: AppConstants.jogar + " " + AppConstants.medio,
              pushDificultyGame: () => MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ),
            PlayGameButton(
              buttonName: AppConstants.jogar + " " + AppConstants.dificil,
              pushDificultyGame: () => MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
