import 'package:mallu_trendy_store/views/detail_page/models/size_model.dart';
import 'package:mallu_trendy_store/views/detail_page/models/variant_model.dart';
import 'package:mallu_trendy_store/views/home/models/product_model.dart';

class ProductEditingArgments {
  ProductModel? product;
  Variant? variant;
  SizeModel? size;
  ProductEditingArgments({this.variant, this.product, this.size});
}
