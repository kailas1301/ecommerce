import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mallu_trendy_store/common_widgets/neumorphic.dart';
import 'package:mallu_trendy_store/gen/assets.gen.dart';
import 'package:mallu_trendy_store/route/argument_model/search_screen_arguments.dart';
import 'package:mallu_trendy_store/route/route_generator.dart';
import 'package:mallu_trendy_store/utils/color_pallette.dart';
import 'package:mallu_trendy_store/utils/font_pallette.dart';
import 'package:mallu_trendy_store/views/categories/models/category_model.dart';
import 'package:mallu_trendy_store/views/detail_page/models/variant_model.dart';
import 'package:mallu_trendy_store/views/home/models/product_model.dart';
import 'package:mallu_trendy_store/views/home/view/widgets/home_products_listview.dart';
import 'package:mallu_trendy_store/views/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import '../../../common_widgets/progress_indicators.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeProvider>().getCategories();
    context.read<HomeProvider>().getAllProducts();
    context.read<HomeProvider>().getAllVariants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallette.scaffoldBgColor,
      body: Selector<HomeProvider, Tuple4>(
        selector: (p0, p1) {
          return Tuple4(
              p1.categoryList, p1.isLoading, p1.productList, p1.variantList);
        },
        builder: (context, value, child) {
          final isLoading = value.item2;
          List<CategoryModel> categoryList = value.item1;
          List<ProductModel> productList = value.item3;
          List<Variant> variantList = value.item4;

          return isLoading
              ? const LoadingAnimationStaggeredDotsWave()
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(15.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            30.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                    child: Text(
                                      "Welcome Back",
                                      style: FontPallette.headingStyle.copyWith(
                                          color: ColorPallette.blackColor),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteGenerator.searchScreen,
                                          arguments: SearchScreenArguments(
                                              productList: productList));
                                    },
                                    child: SizedBox(
                                        height: 35.h,
                                        width: 35.w,
                                        child: SvgPicture.asset(
                                            Assets.searchAltSvgrepoCom)),
                                  )
                                ],
                              ),
                            ),
                            10.verticalSpace,
                            NeumorphicContainer(
                              offset: const Offset(5, 5),
                              blurRadius: 15,
                              height: 200.h,
                              width: 320.w,
                              childWidget: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20.r),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 100.h,
                                        width: 100.w,
                                        child: SvgPicture.asset(
                                            Assets.activitySvgrepoCom),
                                      ),
                                      25.horizontalSpace,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Total Products: ${productList.length}",
                                            style: FontPallette.headingStyle
                                                .copyWith(fontSize: 15.sp),
                                          ),
                                          15.verticalSpace,
                                          Text(
                                            "Total Products: ${productList.length}",
                                            style: FontPallette.headingStyle
                                                .copyWith(fontSize: 15.sp),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            30.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                    productList.isNotEmpty
                        ? SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final category = categoryList[index];
                                return Column(
                                  children: [
                                    HomeProductListWithHeading(
                                      categoryName: category.categoryName ?? "",
                                      variantList: variantList,
                                      products:
                                          // productList,
                                          productList
                                              .where(
                                                (product) =>
                                                    product.categoryId ==
                                                    category.id,
                                              )
                                              .toList(),
                                      productHeading: category.categoryName,
                                    ),
                                  ],
                                );
                              },
                              childCount: categoryList.length,
                            ),
                          )
                        : SliverToBoxAdapter(
                            child: SizedBox(
                              height: 350.h,
                              child: Center(
                                child: Text(
                                  "No Product Found",
                                  style: FontPallette.headingStyle
                                      .copyWith(fontSize: 15.sp),
                                ),
                              ),
                            ),
                          ),
                  ],
                );
        },
      ),
    );
  }
}
