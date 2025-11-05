import 'package:flutter/material.dart';
import 'package:istanbulguidetwo/core/utils/size_config.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? width;
  final double? height;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? SizeConfig.widthMultiplier(50),height ?? SizeConfig.heightMultiplier(6)),
      ),
      child: Text(title),
    );
  }
}
