import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonBase extends StatelessWidget {
  const SkeletonBase({
    Key? key,
    this.width,
    this.height,
    this.radius,
  }) : super(key: key);

  final double? width;
  final double? height;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return SkeletonLine(
      style: SkeletonLineStyle(
        height: height,
        width: width,
        borderRadius: radius,
      ),
    );
  }
}
