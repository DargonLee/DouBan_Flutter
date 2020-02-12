import 'package:flutter/material.dart';

class PopUpWindow {
  static void show(
    BuildContext context,     
    Widget body,
    {
      double top,
      double bottom,
      double left,
      double right,
      double width,
      double height,
      Color backgroundColor = Colors.transparent,
      bool needAutoClose = false,
      int seconds = 1
    }
  ) {
    _PopUpHelper.dismiss();
    _PopUpHelper.createView(context, top, bottom, left, right, width, height, body, backgroundColor, needAutoClose, seconds);
  }

  static void dismiss() {
    _PopUpHelper.dismiss();
  }
}

class _PopUpHelper {  
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createView(BuildContext context, double top, double bottom, double left, double right, double width, double height, 
    Widget body, Color backgroundColor, bool needAutoClose, int seconds) async {        
      _overlayEntry = OverlayEntry(
        builder: (context) {
          return Positioned(
            top: top,
            bottom: bottom,
            left: left,
            right: right,
            width: width,
            height: height,
            child: SafeArea(            
              child: Material(
                color: backgroundColor,
                child: body,
              )
            )
          );
        }
      );
      Overlay.of(context).insert(_overlayEntry);
      _isVisible = true;

      if (needAutoClose) {
        Future.delayed(
          Duration(seconds: seconds),).then((value) {
            dismiss();
          }
        );
      }
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}
