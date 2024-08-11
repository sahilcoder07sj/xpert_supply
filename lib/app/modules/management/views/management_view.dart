import '../../../data/all.dart';
import '../controllers/management_controller.dart';

class ManagementView extends GetView<ManagementController> {
  const ManagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      isLeading: false,
      title: AppStrings.management,
      actions: [
        CommonWidget.circularIconWidget(icon: AppIcons.iconsNotification),
        10.horizontalSpace,
        CommonWidget.circularIconWidget(icon: AppIcons.iconsUser),
        15.horizontalSpace,
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
