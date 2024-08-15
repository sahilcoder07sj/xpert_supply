import '../../../data/all.dart';
import '../controllers/quate_controller.dart';

class QuateView extends GetView<QuateController> {
  const QuateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.quate,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            10.verticalSpace,
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.selectIndex.value = index,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      decoration: CommonWidget.commonShadowWidget(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        "Meet Kakadiya",
                                        fontSize: 15.0,
                                        fontFamily: FontFamily.medium,
                                      ),
                                      AppText(
                                        "\$25",
                                        fontFamily: FontFamily.semiBold,
                                        fontSize: 12,
                                        color: AppColors.priceColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(() => CommonWidget.circularIconWidget(
                                  radius: 15.0,
                                  icon: controller.selectIndex.value == index ? AppIcons.iconsUpArrow : AppIcons.iconsDownArrow,
                                )),
                                5.horizontalSpace,
                              ],
                            ),
                          ),
                          Obx(() => controller.selectIndex.value == index ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              15.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: AppColors.iconBG,
                                      ),
                                      child: SvgPicture.asset(AppIcons.iconsLocation),
                                    ),
                                    6.horizontalSpace,
                                    AppText(
                                      "10 Furnival Street, EC4A 1AB London, UK",
                                      fontSize: 12.0,
                                    )
                                  ],
                                ),
                              ),
                              10.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: AppColors.iconBG,
                                      ),
                                      child: SvgPicture.asset(AppIcons.iconsPhone),
                                    ),
                                    6.horizontalSpace,
                                    AppText(
                                      "+1 1257456541",
                                      fontSize: 12.0,
                                    )
                                  ],
                                ),
                              ),
                              10.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: AppColors.iconBG,
                                      ),
                                      child: SvgPicture.asset(AppIcons.emailSmall),
                                    ),
                                    6.horizontalSpace,
                                    AppText(
                                      "meetkakadiya@gmail.com",
                                      fontSize: 12.0,
                                    )
                                  ],
                                ),
                              ),
                              15.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        AppText(
                                            AppStrings.totalPrice,
                                          fontSize: 12.0,
                                        ),
                                        5.verticalSpace,
                                        Container(
                                          alignment: Alignment.center,
                                          width: 80.0,
                                          padding: EdgeInsets.symmetric(vertical: 5.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            color: AppColors.border.withOpacity(0.1),
                                            border: Border.all(color: AppColors.border.withOpacity(0.2)),
                                          ),
                                          child: AppText(
                                            "\$1000",
                                            fontFamily: FontFamily.medium,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    SvgPicture.asset(AppIcons.nextPrice),
                                    Spacer(),
                                    Column(
                                      children: [
                                        AppText(
                                            AppStrings.offerPrice,
                                          fontSize: 12.0,
                                        ),
                                        5.verticalSpace,
                                        Container(
                                          alignment: Alignment.center,
                                          width: 80.0,
                                          padding: EdgeInsets.symmetric(vertical: 5.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            color: AppColors.border.withOpacity(0.1),
                                            border: Border.all(color: AppColors.border.withOpacity(0.2)),
                                          ),
                                          child: AppText(
                                            "\$700",
                                            fontFamily: FontFamily.medium,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              10.verticalSpace,
                              buildDivider(),
                              10.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  children: [
                                    AppText(
                                      AppStrings.note + " : ",
                                      fontSize: 15.0,
                                      fontFamily: FontFamily.medium,
                                    ),
                                    Expanded(
                                      child: AppText(
                                        "Lorem Ipsum is simply dummy text",
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              10.verticalSpace,
                              buildDivider(),
                              Column(
                                children: [
                                  for(int i = 0 ; i < 2 ; i++)
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 10.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(5.0),
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    color: AppColors.iconBG
                                                ),
                                                child: Image.asset("assets/images/papaiyu.png"),
                                              ),
                                              10.horizontalSpace,
                                              Expanded(
                                                child: AppText(
                                                  "Banana",
                                                  fontSize: 14.0,
                                                  fontFamily: FontFamily.medium,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  AppText(
                                                    AppStrings.quantity,
                                                    fontSize: 10.0,
                                                  ),
                                                  2.verticalSpace,
                                                  AppText(
                                                    "01",
                                                    fontSize: 15.0,
                                                    fontFamily: FontFamily.medium,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // 10.verticalSpace,
                                        if(i != 1)...[
                                          10.verticalSpace,
                                          buildDivider()
                                        ]
                                      ],
                                    )
                                ],
                              ),
                              // 10.verticalSpace,
                            ],
                          ) : SizedBox()),
                        ],
                      ),
                    ),
                  );
                },),
            )
          ],

        ),
      ),
    );
  }

  Container buildDivider() {
    return Container(
      height: 1.0,
      width: double.infinity,
      color: AppColors.divider,
    );
  }
}
