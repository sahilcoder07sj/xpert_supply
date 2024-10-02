import 'package:flutter/services.dart';
import 'package:tbd_flutter/app/CommonWidget/app_text.dart';
import 'package:tbd_flutter/app/data/extenstion.dart';
import 'package:tbd_flutter/app/data/responsive.dart';
import '../data/all.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? prefixIcon;
  final String? title;
  final Widget? suffixIcon;
  final String? hintText;
  final String? fontTextStyle;
  final String? hintFamily;
  final double? fontSize;
  final Color? hintColor;
  final bool isInfinityRadius;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int maxLines;
  final TextAlign textAlign;
  final bool obscureText;
  final InputBorder? border;
  final bool filled;
  final bool autofocus;
  final bool isDense;
  final bool readOnly;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String text)? onSubmit;
  final Function? onPrefixTap;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final bool isShadow;

  CommonTextFormField({
    super.key,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.title,
    this.keyboardType,
    this.textInputAction,
    this.hintText,
    this.maxLength,
    this.border,
    this.maxLines = 1,
    this.contentPadding,
    this.inputFormatters,
    this.fontTextStyle,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.filled = true,
    this.autofocus = false,
    this.isDense = true,
    this.isInfinityRadius = false,
    this.hintFamily,
    this.fontSize,
    this.hintColor,
    this.onSubmit,
    this.onPrefixTap,
    this.fillColor,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.isShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          AppText(
            title ?? "",
            fontFamily: FontFamily.medium,
          ),
          5.verticalSpace,
        ],
        DecoratedBox(
          decoration:
              isShadow ? CommonWidget.commonShadowWidget() : BoxDecoration(),
          child: Theme(
            data: Theme.of(context).copyWith(
              textSelectionTheme: TextSelectionThemeData(
                selectionHandleColor: AppColors.primary,
              ),
            ),
            child: TextFormField(
              controller: controller,
              style: AppTextStyle(
                  fontFamily: fontTextStyle ?? FontFamily.regular,
                  fontSize: fontSize ?? 15),
              onTap: onTap,
              onChanged: onChanged,
              cursorColor: AppColors.primary,
              autofocus: autofocus,
              readOnly: readOnly,
              textAlign: textAlign,
              keyboardType: keyboardType ?? TextInputType.text,
              textInputAction: textInputAction ?? TextInputAction.next,
              maxLength: maxLength,
              maxLines: maxLines,
              obscureText: obscureText,
              inputFormatters: inputFormatters,
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              onFieldSubmitted: (value) {
                if (onSubmit != null) onSubmit!(value);
              },
              decoration: InputDecoration(
                border: border ??
                    customOutlineInputBorder(isInfinityRadius: isInfinityRadius),
                enabledBorder: border ??
                    customOutlineInputBorder(isInfinityRadius: isInfinityRadius),
                disabledBorder: border ??
                    customOutlineInputBorder(isInfinityRadius: isInfinityRadius),
                focusedBorder: border ??
                    customOutlineInputBorder(isInfinityRadius: isInfinityRadius),
                fillColor: fillColor ?? AppColors.white,
                filled: filled,
                isDense: isDense,
                prefixIcon: prefixIcon != null
                    ? GestureDetector(
                        onTap: () {
                          if (onPrefixTap != null) {
                            onPrefixTap!();
                          }
                        },
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Center(
                            child: SvgPicture.asset(prefixIcon ?? ""),
                          ),
                        ),
                      )
                    : null,
                suffixIcon: suffixIcon,
                counterText: "",
                contentPadding:
                    contentPadding ?? EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                hintText: hintText,
                hintStyle: AppTextStyle(
                  fontFamily: hintFamily ?? FontFamily.light,
                  color: hintColor ?? AppColors.primary.withOpacity(0.4),
                  fontSize: 15
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*class CommonTextFieldDropDown extends StatelessWidget {
  final List<String> list;
  final Function(String?)? onChanged;
  final String? value;
  final String? title;
  final String? hintText;
  final String? hintFamily;
  final Color? hintColor;
  final bool isTitle;

  CommonTextFieldDropDown({
    super.key,
    required this.list,
    this.onChanged,
    this.value,
    this.title,
    this.hintText,
    this.hintFamily,
    this.hintColor,
    this.isTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isTitle) ...[
          AppText(
            title ?? "",
            fontFamily: FontFamily.semiBold,
          ),
          5.verticalSpace,
        ],
        DropdownButtonFormField2<String>(
          isExpanded: true,
          hint: AppText(
            hintText ?? "",
            fontFamily: hintFamily ?? FontFamily.medium,
            color: hintColor ?? AppColors.borderColor,
          ),
          iconStyleData: IconStyleData(iconSize: 0.0),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16.0),
            border: customOutlineInputBorder(isInfinityRadius: false),
            focusedBorder: customOutlineInputBorder(isInfinityRadius: false),
            enabledBorder: customOutlineInputBorder(isInfinityRadius: false),
            disabledBorder: customOutlineInputBorder(isInfinityRadius: false),
            filled: true,
            fillColor: AppColors.backgroundColor,
            suffixIcon: CommonImage(
              imageName: AppImages.iconsAeroDown,
            ),
            isDense: true,
          ),
          items: [
            ...list.map((item) => DropdownMenuItem<String>(
              value: item,
              child: AppText(
                item,
                fontFamily: FontFamily.medium,
                fontSize: 16.0,
              ),
            )),
          ],
          value: value,
          selectedItemBuilder: (context) => list.map((String data){
            return AppText(
              data,
              color: AppColors.grayTextColor,
              fontFamily: FontFamily.semiBold,
            );
          }).toList(),
          onChanged: onChanged,
          dropdownStyleData: DropdownStyleData(
            maxHeight: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}*/

OutlineInputBorder customOutlineInputBorder(
    {Color? borderColor, bool isInfinityRadius = false}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(isInfinityRadius ? 100 : 11.0),
    borderSide: BorderSide(color: borderColor ?? AppColors.white),
  );
}
