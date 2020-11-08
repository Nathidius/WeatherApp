import 'package:flutter/material.dart';

class Refresh extends StatelessWidget {
  const Refresh({Key key, @required this.child, @required this.onRefresh})
      : assert(child != null),
        assert(onRefresh != null),
        super(key: key);

  final Widget child;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  maxHeight: constraints.maxHeight),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
