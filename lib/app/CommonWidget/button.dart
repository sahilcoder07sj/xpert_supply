import 'package:tbd_flutter/app/CommonWidget/app_text.dart';

import '../data/all.dart';

class CommonButton extends StatelessWidget {

  final String text;
  void Function()? onTap;

  CommonButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.primary,
        ),
        child: AppText(
          text,
          fontSize: 20.0,
          fontFamily: FontFamily.semiBold,
          color: AppColors.white,
        ),
      ),
    );
  }
}
