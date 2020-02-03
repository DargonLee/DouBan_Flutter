import 'package:flutter/material.dart';

class JumpRoute extends PageRoute {
  final WidgetBuilder builder;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  final Duration transitionDuration;

  JumpRoute(
      {@required this.builder,
      this.opaque = true,
      this.barrierColor,
      this.barrierDismissible = false,
      this.barrierLabel,
      this.maintainState = true,
      this.transitionDuration = const Duration(milliseconds: 300)});

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return super
        .buildTransitions(context, animation, secondaryAnimation, child);
  }
}
