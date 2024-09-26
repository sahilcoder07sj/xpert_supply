import '../data/all.dart';

class CameraGallerySheet extends StatelessWidget {
  final Function()? cameraOnTap;
  final Function()? galleryOnTap;

  const CameraGallerySheet({this.cameraOnTap, this.galleryOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(20)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          20.verticalSpace,
          AppText(
            AppStrings.chooseAnAction,
            fontFamily: FontFamily.medium,
            fontSize: 26,
          ),
          SizedBox(height: responsiveHeight(3)),
          AppText(
            AppStrings.captureOrSelectImage,
            fontFamily: FontFamily.light,
            fontSize: 18,
          ),
          SizedBox(height: responsiveHeight(20)),
          Row(
            children: List.generate(
                2,
                (index) => Expanded(
                      child: GestureDetector(
                        onTap: index == 0 ? cameraOnTap : galleryOnTap,
                        child: Container(
                          margin: EdgeInsets.only(
                            right: responsiveWidth(index == 0 ? 10 : 0),
                            left: responsiveWidth(index == 1 ? 10 : 0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: responsiveHeight(20)),
                          decoration: BoxDecoration(
                              color: AppColors.iconBG,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Container(
                                height: responsiveHeight(70),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x16000000),
                                        blurRadius: 5.30,
                                        offset: Offset(0, 0),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                child: Center(
                                  child: SvgPicture.asset(index == 0
                                      ? AppIcons.iconsCamera
                                      : AppIcons.iconsGallery),
                                ),
                              ),
                              SizedBox(height: responsiveHeight(10)),
                              AppText(
                                index == 0
                                    ? AppStrings.camera
                                    : AppStrings.gallery,
                                fontFamily: FontFamily.medium,
                                fontSize: 15,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
          SizedBox(height: responsiveHeight(20)),
          CommonButton(
              text: AppStrings.cancel,
            onTap: () => Get.back(),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10.0),
        ],
      ),
    );
  }
}
