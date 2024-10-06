import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mallu_trendy_store/common_widgets/textform_field.dart';
import 'package:mallu_trendy_store/utils/color_pallette.dart';
import 'package:mallu_trendy_store/utils/font_pallette.dart';
import 'package:mallu_trendy_store/views/add_product/view_model/add_product_provider.dart';
import 'package:provider/provider.dart';

class AddProductTextFields extends StatelessWidget {
  const AddProductTextFields({
    super.key,
    required this.nameController,
    required this.isNameValidated,
    required this.colorController,
    required this.isColorValidate,
    required this.brandController,
    required this.isBrandValidate,
  });

  final TextEditingController nameController;
  final bool isNameValidated;
  final TextEditingController colorController;
  final bool isColorValidate;
  final TextEditingController brandController;
  final bool isBrandValidate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NuemorphicTextField(
            onChanged: (value) {
              if (value.isEmpty || value.length < 2) {
                context.read<AddProductProvider>().nameValidation(value);
              }
            },
            keyboardType: TextInputType.name,
            textEditingController: nameController,
            headingText: "Name",
            hintText: "Enter name of product",
          ),
          5.verticalSpace,
          !isNameValidated
              ? SizedBox(
                  height: 20.h,
                  child: Text(
                    "Please give a valid name",
                    style: FontPallette.subtitleStyle.copyWith(
                        color: ColorPallette.redColor, fontSize: 10.sp),
                  ),
                )
              : SizedBox(
                  height: 20.h,
                ),
          NuemorphicTextField(
            onChanged: (value) {
              if (value.isEmpty || value.length < 2) {
                context.read<AddProductProvider>().colorValidation(value);
              }
            },
            keyboardType: TextInputType.name,
            textEditingController: colorController,
            headingText: "Color",
            hintText: "Enter color of the product",
          ),
          5.verticalSpace,
          !isColorValidate
              ? SizedBox(
                  height: 20.h,
                  child: Text(
                    "Please give a valid Color",
                    style: FontPallette.subtitleStyle.copyWith(
                        color: ColorPallette.redColor, fontSize: 10.sp),
                  ),
                )
              : SizedBox(
                  height: 20.h,
                ),
          NuemorphicTextField(
            onChanged: (value) {
              if (value.isEmpty || value.length < 2) {
                context.read<AddProductProvider>().brandValidation(value);
              }
            },
            keyboardType: TextInputType.name,
            textEditingController: brandController,
            headingText: "Brand Name",
            hintText: "Enter name of Brand",
          ),
          5.verticalSpace,
          !isBrandValidate
              ? SizedBox(
                  height: 20.h,
                  child: Text(
                    "Please give a valid name",
                    style: FontPallette.subtitleStyle.copyWith(
                        color: ColorPallette.redColor, fontSize: 10.sp),
                  ),
                )
              : SizedBox(
                  height: 20.h,
                )
        ],
      ),
    );
  }
}
