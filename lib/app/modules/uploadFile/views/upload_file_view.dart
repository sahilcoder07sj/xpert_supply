import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbd_flutter/app/CommonWidget/screen.dart';
import 'package:tbd_flutter/app/data/all.dart';
import 'package:tbd_flutter/app/data/app_icons.dart';
import 'package:tbd_flutter/app/data/app_strings.dart';

import '../controllers/upload_file_controller.dart';

class UploadFileView extends GetView<UploadFileController> {
  const UploadFileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      title: AppStrings.uploadFile,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CommonButton(
          text: AppStrings.addProducts,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          SizedBox(height: responsiveHeight(10)),
          Image.asset(
            AppIcons.sampleFile,
          ),
          SizedBox(height: responsiveHeight(20)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                AppStrings.note + " :- ",
                fontSize: 15.0,
                fontFamily: FontFamily.medium,
                color: AppColors.grey,
              ),
              Expanded(
                child: AppText(
                  AppStrings.enterTheDataInto,
                  fontSize: 13.0,
                  color: AppColors.grey,
                  fontFamily: FontFamily.medium,
                ),
              ),
            ],
          ),
          SizedBox(height: responsiveHeight(20)),
          DottedBorder(
            color: Color(0xffB9B9B9),
            dashPattern: [8, 4],
            strokeWidth: 2,
            radius: Radius.circular(10),
            borderType: BorderType.RRect,
            child: Container(
              height: 170,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.uploadCsv,
                  ),
                  // SizedBox(height: 8),
                  AppText(
                    AppStrings.chooseAFileToUploadProducts,
                    fontFamily: FontFamily.medium,
                    fontSize: 16,
                  ),
                  AppText(
                    AppStrings.selectCsv,
                    fontSize: 15.0,
                    fontFamily: FontFamily.medium,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
