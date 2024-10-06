import 'package:flutter/material.dart';

import '../../../../core/utils/text_style.dart';


class TextSpacerText extends StatelessWidget {
  const TextSpacerText(
      {super.key, required this.leadingText, required this.textPress});
  final String leadingText;
  final void Function()? textPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leadingText,
          style: TextStyles.font16BlackW700,
        ),
        const Spacer(),
        TextButton(
            onPressed: textPress,
            child: Text(
              " See All",
              style: TextStyles.font16BlackW500,
            ))
      ],
    );
  }
}
