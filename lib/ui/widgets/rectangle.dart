import 'package:flutter/material.dart';

class Rectangle extends StatelessWidget {
  Rectangle({Key key, this.child, this.size}) : super(key: key);

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
