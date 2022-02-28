import 'package:flutter/material.dart';
import 'package:workspace/presentation/helpers/size_configuration.dart';

class WorkspaceFeature extends StatelessWidget {
  final Color color;
  final Widget widget;
  const WorkspaceFeature({Key? key, required this.color, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: SizeConfig.defaultSize),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(SizeConfig.defaultSize / 2),
      child:widget,
    );
  }
}
