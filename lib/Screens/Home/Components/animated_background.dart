import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// Create enum that defines the animated properties
enum AniProps { color1, color2 }

class AnimatedBackground extends StatelessWidget {
  final Widget child;
  final MultiTween tween = MultiTween();

  /*final tween = MultiTween([
    Tweent('color').add(Duration(seconds: 2),
        ColorTween(begin: Colors.indigo, end: Colors.indigoAccent),
        curve: Curves.linear),
    Track('color1').add(Duration(seconds: 2),
        ColorTween(begin: Colors.indigoAccent, end: Colors.indigo),
        curve: Curves.linear),
  ]);*/

  AnimatedBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    // Specify your tween
    final TimelineTween<AniProps> _tween = TimelineTween<AniProps>()
      ..addScene(
              begin: Duration.zero,
              duration: const Duration(milliseconds: 2000))
          .animate(AniProps.color1,
              tween: ColorTween(begin: Colors.indigo, end: Colors.indigoAccent),
              curve: Curves.linear)
      ..addScene(
              begin: const Duration(milliseconds: 2000),
              duration: const Duration(milliseconds: 4000))
          .animate(AniProps.color2,
              tween: ColorTween(begin: Colors.indigoAccent, end: Colors.indigo),
              curve: Curves.linear);
    return LoopAnimation<TimelineValue<AniProps>>(
      tween: _tween,
      duration: _tween.duration,
      builder: (context, _, value) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                value.get(AniProps.color1),
                value.get(AniProps.color2),
              ],
            ),
          ),
          child: SafeArea(child: child),
        );
      },
    );
  }
}
