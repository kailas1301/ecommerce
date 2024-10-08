import 'package:mallu_trendy_store/views/add_orders/view_model/order_provider.dart';
import 'package:mallu_trendy_store/views/add_product/view_model/add_product_provider.dart';
import 'package:mallu_trendy_store/views/add_size/view_model/add_size_provider.dart';
import 'package:mallu_trendy_store/views/add_variant/view_model/add_variant_provider.dart';
import 'package:mallu_trendy_store/views/categories/view_model.dart/catgeory_provider.dart';
import 'package:mallu_trendy_store/views/detail_page/view_model/product_detail_provider.dart';
import 'package:mallu_trendy_store/views/edit_product/view_model/edit_product_provider.dart';
import 'package:mallu_trendy_store/views/home/view_model/home_provider.dart';
import 'package:mallu_trendy_store/views/main_screen/viemodel/main_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Multiproviders {
  static List<SingleChildWidget> providerList = [
    ChangeNotifierProvider(
      create: (context) => MainScreenProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AddProductProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CatgeoryProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => EditProductProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductDetailProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AddVariantProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AddSizeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => OrderProvider(),
    )
  ];
}
