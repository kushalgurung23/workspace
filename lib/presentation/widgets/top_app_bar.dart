import 'package:flutter/material.dart';
import 'package:workspace/presentation/helpers/size_configuration.dart';

AppBar topAppBar(
    {required BuildContext context,
    bool useLeading = true,
    Widget? leadingFirstIcon,
    double? toolBarHeight,
    VoidCallback? leadingFirstOnPress,
    Widget? titleWidget,
    flexibleSpace,
    Widget? secondGestureWidget,
    VoidCallback? secondGestureOnPress,
    List<Widget>? trailingWidget,
    double? elevation,
    Color? shadowColor,
    required bool useTrailingGesture}) {
  SizeConfig.init(context);
  return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 10,
      flexibleSpace: flexibleSpace,
      toolbarHeight: toolBarHeight,
      backgroundColor: Colors.white,
      elevation: elevation,
      shadowColor: shadowColor,
      title: titleWidget,
      leading: useLeading
          ? Center(
              child: IconButton(
                splashRadius: SizeConfig.defaultSize * 2.5,
                onPressed: leadingFirstOnPress,
                icon: leadingFirstIcon!,
                color: Colors.black,
              ),
            )
          : null,
      actions: useTrailingGesture
          ? [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: SizeConfig.defaultSize * 2),
                  child: GestureDetector(
                    child: secondGestureWidget,
                    onTap: secondGestureOnPress,
                  ),
                ),
              ),
            ]
          : trailingWidget!);
}
