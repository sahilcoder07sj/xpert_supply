import 'dart:io';


import 'package:tbd_flutter/app/CommonWidget/camera_bottom_sheet.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/data/utils.dart';

class CommonImageWidget extends StatelessWidget {
  final String? image;
  final Function()? cameraOnTap;
  final Function()? galleryOnTap;
  CommonImageWidget({
    this.image,
    this.cameraOnTap,
    this.galleryOnTap,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: responsiveHeight(130),
          width: responsiveWidth(130),
          child: Container(
            padding: EdgeInsets.all(10),
            height: responsiveHeight(90),
            width: responsiveWidth(90),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white,
                width: 1.5,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: AppColors.orange.withOpacity(0.2),
              ),
              child: ClipOval(
                child: Utils.isValidationEmpty(image)
                    ? Icon(
                  Icons.person,
                  // color: AppColors.orange,
                  size: 50,
                )
                    : Image.file(
                  File(image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -10,
          child: GestureDetector(
            onTap: () {
              Utils.hideKeyboard();
              Get.bottomSheet(
                CameraGallerySheet(
                  cameraOnTap: cameraOnTap,
                  galleryOnTap: galleryOnTap,
                ),
              );
            },
            child: Material(
              color: AppColors.transparent,
              shape: CircleBorder(),
              elevation: 5.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: responsiveHeight(6.0), vertical: responsiveWidth(6.0)),
                height: responsiveHeight(32.0),
                width: responsiveWidth(32.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(AppIcons.iconsEdit,color: AppColors.primary,),
              ),
            ),
          ),
        ),
      ],
    );
  }
}