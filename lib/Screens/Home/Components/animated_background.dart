import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatelessWidget {
  final Widget child;
  final tween = MultiTrackTween([
    Track('color').add(Duration(seconds: 2),
        ColorTween(begin: Colors.indigo, end: Colors.indigoAccent),
        curve: Curves.linear),
    Track('color1').add(Duration(seconds: 2),
        ColorTween(begin: Colors.indigoAccent, end: Colors.indigo),
        curve: Curves.linear),
  ]);

  AnimatedBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          child: SafeArea(child: child),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                animation['color'],
                animation['color1'],
              ],
            ),
          ),
        );
      },
    );
  }
}
