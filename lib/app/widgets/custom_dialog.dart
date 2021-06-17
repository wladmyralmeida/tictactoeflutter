import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/core/app_colors.dart';
import 'package:tic_tac_toe/app/core/app_constants.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  CustomDialog(this.title, this.content, this.callback,
      [this.actionText = AppConstants.recomecar]);
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text(title),
      content: new Text(content),
      actions: <Widget>[
        new TextButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color?>(AppColors.white)),
          onPressed: callback,
          child: new Text(actionText),
        )
      ],
    );
  }
}
