import 'package:flutter/material.dart';
import 'package:weather_app/resources/dimensions.dart';
import 'package:weather_app/resources/font_sizes.dart';
import 'package:weather_app/resources/strings.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({Key key, @required this.onPressed})
      : assert(onPressed != null),
        super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.medium,
        horizontal: Dimensions.large,
      ),
      color: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.large)),
      child: const Text(
        Strings.retry,
        style: TextStyle(
          color: Colors.white,
          fontSize: FontSizes.medium,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
