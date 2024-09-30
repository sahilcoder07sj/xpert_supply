import 'package:tbd_flutter/app/data/all.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.notification,
      body: Center(
        child: SvgPicture.asset(AppIcons.emptyProduct),
      ),
    );
  }
}
