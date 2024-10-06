import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mallu_trendy_store/common/common_functions/show_pop_up.dart';
import 'package:mallu_trendy_store/common_widgets/neumorphic.dart';
import 'package:mallu_trendy_store/route/argument_model/add_product__arguments.dart';
import 'package:mallu_trendy_store/route/route_generator.dart';
import 'package:mallu_trendy_store/utils/font_pallette.dart';
import 'package:mallu_trendy_store/views/categories/models/category_model.dart';
import 'package:mallu_trendy_store/views/categories/view_model.dart/catgeory_provider.dart';
import 'package:provider/provider.dart';

class CategoryGridview extends StatelessWidget {
  const CategoryGridview({
    super.key,
    required this.categoryList,
  });

  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: categoryList.isNotEmpty
          ? GridView.builder(
              padding: EdgeInsets.only(top: 15.h),
              itemCount: categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6 / 4,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onLongPressStart: (details) {
                  context.read<CatgeoryProvider>().changeSelectedCategory(
                      categoryList[index].categoryName ?? "");
                  showPopup(
                      context,
                      index,
                      details.globalPosition,
                      categoryList[index].id ?? "",
                      categoryList[index].categoryName ?? "");
                },
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteGenerator.addProductScreen,
                    arguments: AddProductArguments(
                      categoryId: categoryList[index].id ?? "",
                      categoryName: categoryList[index].categoryName,
                    ),
                  );
                },
                child: NeumorphicContainer(
                  offset: const Offset(5, 5),
                  blurRadius: 10.r,
                  width: 150.w,
                  childWidget: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            categoryList[index].categoryName ?? "",
                            maxLines: 2,
                            style: FontPallette.headingStyle.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: Text(
                " No Category found add One",
                style: FontPallette.headingStyle.copyWith(fontSize: 15.sp),
              ),
            ),
    );
  }
}
