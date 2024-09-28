import '../data/all.dart';

class CommonScreen extends StatelessWidget {
  final bool isAppbar;
  final Widget? body;
  final bool isLeading;
  final String? title;
  final Function()? leadingOnTap;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;
  final bool? extendBodyBehindAppBar;
  final List<Widget>? actions;

  CommonScreen({
    super.key,
    this.isAppbar = true,
    this.body,
    this.leadingOnTap,
    this.isLeading = true,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.extendBodyBehindAppBar = false,
    this.title,
    this.actions,
    this.appBarBackgroundColor,
    this.backgroundColor,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.screenBG,
      extendBody: true,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      appBar: isAppbar
          ? AppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
              backgroundColor: appBarBackgroundColor ?? AppColors.screenBG,
              surfaceTintColor: AppColors.screenBG,
              title: title != null
                  ? AppText(
                      title ?? "",
                      fontSize: 20,
                    )
                  : null,
              leading: isLeading
                  ? GestureDetector(
                      onTap:leadingOnTap ?? () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: CircleAvatar(
                          backgroundColor: AppColors.iconBG,
                          child: SvgPicture.asset(
                            AppIcons.iconsBack,
                          ),
                        ),
                      ),
                    )
                  : null,
              actions: actions,
              automaticallyImplyLeading: automaticallyImplyLeading,
            )
          : null,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
