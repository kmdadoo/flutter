// flippable_box: ^1.0.6 에서 가져옴. 야믈에 넣어야 할 것을 직접 만든 것임.
// 버전 업 안된 것들을 이렇게 가져와서 사용 가능.
import 'dart:math';
import 'package:flutter/material.dart';

class FlippableBox extends StatelessWidget {
  final double clipRadius;
  final double duration;
  final Curve curve;
  final bool flipVt;
  // final BoxDecoration bg;
  final Container front;
  final Container back;

  final bool isFlipped;

  const FlippableBox(
      {Key? key, // null 체크
      this.isFlipped = false,
      required this.front,
      required this.back,
      // required this.bg,
      this.clipRadius = 0, // 초기값을 0으로...
      this.duration = 1,
      this.curve = Curves.easeOut,
      this.flipVt = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: (duration * 1000).round()),
      curve: Curves.easeOut,
      tween: Tween(begin: 0.0, end: isFlipped ? 180.0 : 0.0),
      builder: (context, double value, child) {
        // value 실수로 선언
        var content = value >= 90 ? back : front;
        return Rotation3d(
          rotationY: !flipVt ? value : 0,
          rotationX: flipVt ? value : 0,
          child: Rotation3d(
            rotationY: !flipVt ? (value > 90 ? 180 : 0) : 0,
            rotationX: flipVt ? (value > 90 ? 180 : 0) : 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(clipRadius),
              child: AnimatedBackground(
                // decoration: bg,
                child: content,
              ),
            ),
          ),
        );
      },
    );
  }
}

class Rotation3d extends StatelessWidget {
  //Degrees to rads constant
  static const double degrees2Radians = pi / 180;

  final Widget child;
  final double rotationX;
  final double rotationY;
  final double rotationZ;

  const Rotation3d(
      {Key? key, // null 체크
      required this.child,
      this.rotationY = 0,
      this.rotationZ = 0,
      this.rotationX = 0})
      : super(key: key); // x도 초기값을줌.

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(rotationX * degrees2Radians)
          ..rotateY(rotationY * degrees2Radians)
          ..rotateZ(rotationZ * degrees2Radians),
        child: child);
  }
}

class AnimatedBackground extends StatelessWidget {
  final Container child;
  // final BoxDecoration decoration;

  const AnimatedBackground({
    Key? key,
    required this.child,
    // required this.decoration
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: child.constraints!.maxWidth, // null일수 있으므로 ! 으로 체크
        height: child.constraints!.maxHeight,
        // decoration: decoration,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        child: child);
  }
}
