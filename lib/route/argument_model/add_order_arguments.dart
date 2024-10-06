import 'package:mallu_trendy_store/views/detail_page/models/size_model.dart';
import 'package:mallu_trendy_store/views/detail_page/models/variant_model.dart';
import 'package:mallu_trendy_store/views/home/models/product_model.dart';

class AddOrderArguments {
  Variant? variant;
  ProductModel? product;
  SizeModel? size;
  String? categoryName;

  AddOrderArguments({this.product, this.size, this.variant, this.categoryName});
}
