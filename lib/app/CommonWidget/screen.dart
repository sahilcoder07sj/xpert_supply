import '../data/all.dart';

class CommonScreen extends StatelessWidget {

  final bool isAppbar;
  final Widget? body;
  final bool isLeading;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final List<Widget>? actions;

  CommonScreen({
    super.key,
    this.isAppbar = true,
    this.body,
    this.isLeading = true,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.title,
    this.actions,
    this.backgroundColor,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.screenBG,
      appBar: isAppbar ? AppBar(
        backgroundColor: AppColors.screenBG,
        surfaceTintColor: AppColors.screenBG,
        title: title != null ? AppText(
            title ?? "",
          fontSize: 26.0,
        ) : null,
        leading: isLeading ? GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: CircleAvatar(
              backgroundColor: AppColors.iconBG,
              child: SvgPicture.asset(AppIcons.iconsBack),
            ),
          ),
        ) : null,
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
      ) : null,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
