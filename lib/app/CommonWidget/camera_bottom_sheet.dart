import '../data/all.dart';

class CameraGallerySheet extends StatelessWidget {
  final Function()? cameraOnTap;
  final Function()? galleryOnTap;

  const CameraGallerySheet({this.cameraOnTap, this.galleryOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(20), vertical: responsiveHeight(30)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Wrap(
        spacing: 20,
        children: [
          Column(
            children: [
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
                            onTap: index == 1 ? cameraOnTap : galleryOnTap,
                            child: Container(
                              margin: EdgeInsets.only(
                                right: responsiveWidth(index == 0 ? 10 : 0),
                                left: responsiveWidth(index == 1 ? 10 : 0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: responsiveWidth(20),
                                  vertical: responsiveHeight(30)),
                              decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6).withOpacity(0.3),
                                  border: Border.all(
                                      color: AppColors.grey.withOpacity(0.3)),
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
                                            color:
                                                Colors.black.withOpacity(0.09),
                                            blurRadius: 3,
                                          )
                                        ]
                                        // gradient: utils.commonGradient,
                                        ),
                                    child: Center(
                                      child: SvgPicture.asset(index == 1
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
              CommonButton(text: AppStrings.cancel)
            ],
          ),
        ],
      ),
    );
  }
}
