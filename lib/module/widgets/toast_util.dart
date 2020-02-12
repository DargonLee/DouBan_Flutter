import 'package:flutter/material.dart';
import 'package:douban/module/widgets/popup_window.dart';

enum ToastPosition {Bottom, Center, Top}

class ToastUtil {
  static void show(
    BuildContext context, 
    String msg,     
    {ToastPosition postion = ToastPosition.Bottom, 
    Color backgroundColor = Colors.black, 
    Color textColor = Colors.white, 
    double backgroundRadius = 20}) {

    _ToastHelper.showMessage(context, msg, postion, backgroundColor, textColor, backgroundRadius);
  }
}

class _ToastHelper {
  static void showMessage(BuildContext context, String msg, ToastPosition position,
    Color backgroundColor, Color textColor, double backgroundRadius) {
      Widget body = Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(backgroundRadius),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Text(
            msg, 
            softWrap: true, 
            style: TextStyle(fontSize: 15, color: textColor)
          )
        )
    );

    PopUpWindow.show(
      context,
      body,
      top: position == ToastPosition.Top ? 50 : null,
      bottom: position == ToastPosition.Bottom ? 50 : null,
      needAutoClose: true,
      seconds: 1
    );
  }
}