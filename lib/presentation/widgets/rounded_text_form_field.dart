import 'package:flutter/material.dart';
import 'package:workspace/presentation/helpers/size_configuration.dart';

class RoundedTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  const RoundedTextFormField(
      {Key? key, required this.textEditingController, required this.hintText, required this.onChanged, required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 1.5),
      height: SizeConfig.defaultSize * 5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC4C4C4)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        obscureText: obscureText ? true : false,
        onChanged: onChanged,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                color: const Color(0xFFC4C4C4),
                fontSize: SizeConfig.defaultSize * 1.5,
                fontFamily: 'Abyssinica400')),
        controller: textEditingController,
      ),
    );
  }
}
