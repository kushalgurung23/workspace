import 'package:flutter/material.dart';
import 'package:workspace/presentation/helpers/size_configuration.dart';

class RectangularButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Color textColor, buttonColor;
  final double? height, width;

  const RectangularButton(
      {Key? key,
      required this.onPress,
      required this.text,
      required this.textColor,
      required this.buttonColor,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPress,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 1.5),
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontSize: SizeConfig.defaultSize * 1.5,
                fontFamily: 'Abhaya600',
                letterSpacing: 0.5
            ),
          ),
        ),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Color(0xFFFFFFFF))),
          backgroundColor: buttonColor,
        ),
      ),
    );
  }
}
