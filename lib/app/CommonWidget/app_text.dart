import 'package:flutter/gestures.dart';
import 'package:tbd_flutter/app/data/responsive.dart';
import '../data/all.dart';

class AppText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double? fontSize;
  final Color? color;
  final double? letterSpacing;
  final double? height;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  AppText(
    this.text, {
    this.fontSize,
    this.color,
    this.fontFamily = FontFamily.regular,
    this.letterSpacing,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.start,
    this.height,
    this.maxLines = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        height: height,
        color: color ?? AppColors.primary,
        fontFamily: fontFamily,
        fontSize: responsiveText(fontSize ?? 14),
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        overflow: overflow,
        decorationColor: color ?? AppColors.primary,
      ),
    );
  }
}

TextStyle AppTextStyle({
  Color? color,
  String? fontFamily,
  double? fontSize,
  double? letterSpacing,
  TextDecoration? textDecoration,
  TextOverflow? overflow,
}) {
  return TextStyle(
    color: color ?? AppColors.primary,
    fontFamily: fontFamily ?? FontFamily.regular,
    fontSize: fontSize ?? 18.0,
    letterSpacing: letterSpacing,
    decoration: textDecoration,
    overflow: overflow,
    decorationColor: color ?? AppColors.primary,
  );
}

class AppRichText extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final String? thirdText;
  final String? forthText;
  final double? height;
  final String? firstTextFontFamily;
  final String? secondTextFontFamily;
  final String? thirdTextFontFamily;
  final String? fourthTextFontFamily;
  final FontWeight? firstFontWeight;
  final FontWeight? secondFontWeight;
  final FontWeight? thirdFontWeight;
  final FontWeight? fourthFontWeight;
  final TextDecoration? firstDecoration;
  final TextDecoration? secondDecoration;
  final TextDecoration? thirdDecoration;
  final TextDecoration? fourthDecoration;
  final Color? firstTextColor;
  final Color? secondTextColor;
  final Color? thirdTextColor;
  final Color? fourthTextColor;
  final TextAlign? textAlign;
  final double? fontSize;
  final Function()? onTap;
  final Function()? onTapFourth;
  const AppRichText(
      {super.key,
      this.firstText,
      this.secondText,
      this.onTap,
      this.thirdText,
      this.forthText,
      this.onTapFourth,
      this.firstTextColor,
      this.secondTextColor,
      this.thirdTextColor,
      this.fourthTextColor,
      this.fontSize,
      this.firstTextFontFamily,
      this.firstFontWeight,
      this.fourthFontWeight,
      this.secondFontWeight,
      this.thirdFontWeight,
      this.height,
      this.textAlign,
      this.fourthTextFontFamily,
      this.secondTextFontFamily,
      this.thirdTextFontFamily,
      this.firstDecoration,
      this.secondDecoration,
      this.thirdDecoration,
      this.fourthDecoration});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        textAlign: textAlign ?? TextAlign.start,
        overflow: TextOverflow.visible,
        text: TextSpan(
          text: firstText!,
          recognizer: TapGestureRecognizer()..onTap = () {},
          style: TextStyle(
            fontSize: fontSize ?? 18.0,
            color: firstTextColor ?? AppColors.primary,
            fontFamily: firstTextFontFamily ?? FontFamily.light,
            height: height ?? 1.3,
            decoration: firstDecoration,
          ),
          children: [
            TextSpan(
              text: secondText!,
              recognizer: TapGestureRecognizer()..onTap = onTap,
              style: TextStyle(
                fontSize: fontSize ?? 18.0,
                color: secondTextColor ?? AppColors.primary,
                fontFamily: secondTextFontFamily ?? FontFamily.regular,
                decoration: secondDecoration,
              ),
            ),
            TextSpan(
              text: thirdText ?? "",
              recognizer: TapGestureRecognizer()..onTap = () {},
              style: TextStyle(
                fontSize: fontSize ?? 18.0,
                color: thirdTextColor ?? AppColors.primary,
                fontFamily: thirdTextFontFamily ?? FontFamily.light,
                decoration: thirdDecoration,
              ),
            ),
            TextSpan(
              text: forthText ?? "",
              recognizer: TapGestureRecognizer()..onTap = onTapFourth,
              style: TextStyle(
                fontSize: fontSize ?? 18.0,
                color: fourthTextColor ?? AppColors.primary,
                fontFamily: fourthTextFontFamily ?? FontFamily.regular,
                decoration: fourthDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
