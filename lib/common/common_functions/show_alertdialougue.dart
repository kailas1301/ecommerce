import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mallu_trendy_store/common_widgets/textform_field.dart';
import 'package:mallu_trendy_store/utils/color_pallette.dart';
import '../../utils/font_pallette.dart';

void showAlertDialog(
    {required BuildContext context,
    required String headingText,
    required TextEditingController controller,
    required VoidCallback onAddCategory}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          height: 100.h,
          width: 350.w,
          child: Column(
            children: [
              NuemorphicTextField(
                headingText: headingText,
                keyboardType: TextInputType.name,
                textEditingController: controller,
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      onAddCategory();
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: ColorPallette.blackColor,
                          borderRadius: BorderRadius.circular(15)),
                      height: 40.h,
                      width: 110.w,
                      child: Center(
                          child: Text(
                        'Save',
                        style: FontPallette.headingStyle.copyWith(
                            fontSize: 13.sp, color: ColorPallette.whiteColor),
                      )))),
              20.horizontalSpace,
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: ColorPallette.blackColor,
                        borderRadius: BorderRadius.circular(15)),
                    height: 40.h,
                    width: 110.w,
                    child: Center(
                        child: Text(
                      'Cancel',
                      style: FontPallette.headingStyle.copyWith(
                          fontSize: 13.sp, color: ColorPallette.whiteColor),
                    ))),
              ),
            ],
          ),
        ],
      );
    },
  );
}
