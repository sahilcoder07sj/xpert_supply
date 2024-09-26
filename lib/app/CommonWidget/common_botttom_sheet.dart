import 'dart:ui';
import 'package:tbd_flutter/app/data/utils.dart';
import '../data/all.dart';

class CommonBottomSheet extends StatelessWidget {
  final String? title;
  final String? image;
  final String? subTitle;
  final String? firstButtonText;
  final String? secondButtonText;
  final String? singleButtonText;
  final Widget? widget;
  final Color? iconBgColor;
  final bool isOneButton;
  final Function()? firstOnTap;
  final Function()? secondOnTap;
  final Function()? commonOnTap;

  const CommonBottomSheet({
    this.title,
    this.subTitle,
    this.image,
    this.firstOnTap,
    this.secondOnTap,
    this.widget,
    this.firstButtonText,
    this.secondButtonText,
    this.singleButtonText,
    this.commonOnTap,
    this.iconBgColor,
    this.isOneButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 3.0,
        sigmaY: 3.0,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: responsiveHeight(20), horizontal: responsiveWidth(20)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: AppColors.white,
        ),
        child: Wrap(
          spacing: 20,
          children: [
            Center(
              child: Column(
                children: [
                  if(!Utils.isValidationEmpty(image))...[
                    CircleAvatar(
                      radius: 45.0,
                      backgroundColor: iconBgColor ?? AppColors.primary.withOpacity(0.1),
                      child: SvgPicture.asset(
                        image!,
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                  if(!Utils.isValidationEmpty(title))...[
                    AppText(
                      title ?? "",
                      fontSize: 22,
                      textAlign: TextAlign.center,
                      fontFamily: FontFamily.medium,
                    ),
                    SizedBox(height: responsiveHeight(10.0),),
                  ],
                  if(!Utils.isValidationEmpty(subTitle))...[
                    AppText(
                      subTitle ?? "",
                      fontSize: 15,
                      color: AppColors.primary,
                      textAlign: TextAlign.center,
                      fontFamily: FontFamily.light,
                    ),
                    SizedBox(height: responsiveHeight(20.0)),
                  ],
                  isOneButton == false ? Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          bgColor: AppColors.white,
                          borderColor: AppColors.primary,
                          fontColor: AppColors.primary,
                          onTap: firstOnTap,
                          textSize: 15,
                          text:firstButtonText ?? AppStrings.yes,
                        ),
                      ),
                      SizedBox(width: responsiveWidth(20.0)),
                      Expanded(
                        child: CommonButton(
                          bgColor: AppColors.primary,
                          fontColor: AppColors.white,
                          textSize: 15,
                          onTap:secondOnTap ?? () {
                            Get.back();
                          },
                          text:secondButtonText ?? AppStrings.no,
                        ),
                      )
                    ],
                  ) : CommonButton(
                    bgColor: AppColors.primary,
                    fontColor: AppColors.white,
                    onTap: commonOnTap,
                    text: singleButtonText ?? "",
                  ),
                  widget ?? SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
