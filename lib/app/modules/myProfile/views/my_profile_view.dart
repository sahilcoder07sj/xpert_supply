import '../../../data/all.dart';
import '../controllers/my_profile_controller.dart';

class MyProfileView extends GetView<MyProfileController> {
  const MyProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.myProfile,
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        itemCount: controller.myProfileList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.onTapIndex(controller.myProfileList[index].title ?? ""),
            child: controller.myProfileList[index].isCheck?.value == true ? Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(bottom: 14.0),
              decoration: CommonWidget.commonShadowWidget(),
              child: Row(
                children: [
                  Expanded(
                    child: AppText(
                        controller.myProfileList[index].title ?? "",
                      fontSize: 15.0,
                    ),
                  ),
                  SvgPicture.asset(AppIcons.iconsRightArrow)
                ],
              ),
            ) : SizedBox(),
          );
      },),
    );
  }
}
