import 'package:flutter/material.dart';

class Rectangle extends StatelessWidget {
  const Rectangle({
    Key? key,
    required this.child,
    required this.size,
  }) : super(key: key);

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: child,
    );
  }
}
