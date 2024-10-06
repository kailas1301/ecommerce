import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mallu_trendy_store/gen/assets.gen.dart';
import 'package:mallu_trendy_store/utils/color_pallette.dart';
import 'package:mallu_trendy_store/utils/font_pallette.dart';
import 'package:mallu_trendy_store/views/categories/view/categories.dart';
import 'package:mallu_trendy_store/views/home/view/home_screen.dart';
import 'package:mallu_trendy_store/views/main_screen/viemodel/main_screen_provider.dart';
import 'package:mallu_trendy_store/views/orders/order_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainscreenProvider = Provider.of<MainScreenProvider>(context);
    final PageController pageController = PageController();
    List<String> icons = [
      Assets.home1SvgrepoCom,
      Assets.addSquareSvgrepoCom,
      Assets.activitySvgrepoCom,
    ];
    List<String> bottomnavText = ["Home", "Add", "Orders"];

    List<Widget> screenList = [
      const HomeScreen(),
      const CategoriesScreen(),
      const OrderScreen()
    ];
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: PageView(
            controller: pageController,
            onPageChanged: (value) {
              mainscreenProvider.updateIndex(value);
            },
            children: screenList),
        bottomNavigationBar: Selector<MainScreenProvider, int>(
          selector: (_, mainScreenProvider) => mainScreenProvider.selectedIndex,
          builder: (context, value, child) {
            return BottomNavigationBar(
              enableFeedback: false,
              mouseCursor: SystemMouseCursors.none,
              backgroundColor: ColorPallette.scaffoldBgColor,
              selectedLabelStyle:
                  FontPallette.headingStyle.copyWith(fontSize: 13.sp),
              showUnselectedLabels: false,
              currentIndex: value,
              iconSize: 20,
              selectedFontSize: 12,
              elevation: 0,
              selectedItemColor: ColorPallette.blackColor,
              unselectedItemColor: ColorPallette.greyColor,
              onTap: (value) {
                mainscreenProvider.updateIndex(value);
                pageController.jumpToPage(
                  value,
                );
              },
              items: List.generate(
                bottomnavText.length,
                (index) {
                  return BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      icons[index],
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        ColorPallette.greyColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    activeIcon: SvgPicture.asset(
                      icons[index],
                      width: 30,
                      height: 30,
                      colorFilter: ColorFilter.mode(
                        ColorPallette.blackColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: bottomnavText[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
