import 'package:tbd_flutter/app/CommonWidget/app_text.dart';

import '../data/all.dart';

class CommonButton extends StatelessWidget {

  final String text;
  final double? textSize;
  void Function()? onTap;
  AlignmentGeometry? alignment;
  Color? borderColor;
  Color? bgColor;
  Color? fontColor;

  CommonButton({
    super.key,
    required this.text,
    this.onTap,
    this.textSize,
    this.alignment,
    this.borderColor,
    this.bgColor,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: bgColor ?? AppColors.primary,
          border: Border.all(color: borderColor ?? AppColors.primary)
        ),
        child: AppText(
          text,
          fontSize: textSize ?? 20.0,
          fontFamily: FontFamily.semiBold,
          color: fontColor ?? AppColors.white,
        ),
      ),
    );
  }
}
