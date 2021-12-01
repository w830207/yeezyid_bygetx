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
    this.width,
  }) : super(key: key);

  final ShapeBorder? shape;
  final void Function()? onPressed;
  final Color color;
  final Widget child;
  final Color? textColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(this.textColor),
          backgroundColor: MaterialStateProperty.all(this.color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: this.onPressed,
        child: this.child,
      ),
    );
  }
}
