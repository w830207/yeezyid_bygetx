import 'package:flutter/material.dart';
import 'package:yeezyid_bygetx/app/core/colors.dart';

class OurButton extends StatelessWidget {
  OurButton({
    Key? key,
    this.shape,
    required this.onPressed,
    required this.child,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.minWidth,
  }) : super(key: key);

  final ShapeBorder? shape;
  final void Function()? onPressed;
  final Color color;
  final Widget child;
  final Color? textColor;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: this.color,
      onPressed: this.onPressed,
      child: this.child,
      textColor: this.textColor,
      minWidth: this.minWidth,
    );
  }
}
