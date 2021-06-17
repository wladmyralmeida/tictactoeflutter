import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/core/app_colors.dart';
import 'package:tic_tac_toe/app/core/app_constants.dart';
import 'package:tic_tac_toe/app/widgets/touch_button.dart';
import 'package:tic_tac_toe/app/widgets/custom_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TouchButton> buttonsList = [];
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<TouchButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;

    var gameButtons = <TouchButton>[
      TouchButton(id: 1),
      TouchButton(id: 2),
      TouchButton(id: 3),
      TouchButton(id: 4),
      TouchButton(id: 5),
      TouchButton(id: 6),
      TouchButton(id: 7),
      TouchButton(id: 8),
      TouchButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(TouchButton button) {
    setState(
      () {
        if (activePlayer == 1) {
          button.name = "X";
          button.colorBackground = AppColors.red;
          activePlayer = 2;
          player1.add(button.id);
        } else {
          button.name = "0";
          button.colorBackground = AppColors.black;
          activePlayer = 1;
          player2.add(button.id);
        }
        button.enabled = false;
        int winner = checkWinner();
        if (winner == -1) {
          if (buttonsList.every((p) => p.name != "")) {
            showDialog(
              context: context,
              builder: (_) => CustomDialog(
                  AppConstants.empate, AppConstants.novoJogo, resetGameAndRemovePopUp),
            );
          } else {
            activePlayer == 2 ? autoPlay() : null;
          }
        }
      },
    );
  }

  void autoPlay() {
    var emptyCells = [];
    var list = List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellID);
    playGame(buttonsList[i]);
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    // row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    // row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    // col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    // col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    // col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    //diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                AppConstants.player1Win, AppConstants.novoJogo, resetGameAndRemovePopUp));
      } else {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                AppConstants.player2Win, AppConstants.novoJogo, resetGameAndRemovePopUp));
      }
    }

    return winner;
  }

  void resetGame() {
    setState(() {
      buttonsList = doInit();
    });
  }

  void resetGameAndRemovePopUp() {
    Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.jogoDaVelha),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 500,
            width: double.maxFinite,
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
              itemCount: buttonsList.length,
              itemBuilder: (context, i) => ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(10),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      buttonsList[i].colorBackground),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      buttonsList[i].colorBackground),
                  overlayColor: MaterialStateProperty.all<Color>(
                      buttonsList[i].colorBackground),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(8.0)),
                ),
                onPressed: buttonsList[i].enabled
                    ? () => playGame(buttonsList[i])
                    : null,
                child: Text(
                  buttonsList[i].name,
                  style: TextStyle(color: AppColors.white, fontSize: 100.0),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(AppColors.green),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(20.0)),
            ),
            child: Text(
              AppConstants.recomecar,
              style: TextStyle(color: AppColors.white, fontSize: 20.0),
            ),
            onPressed: resetGame,
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(AppColors.red),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(20.0)),
            ),
            child: Text(
              AppConstants.sair,
              style: TextStyle(color: AppColors.white, fontSize: 20.0),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
