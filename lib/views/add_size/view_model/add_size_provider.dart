import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mallu_trendy_store/common/common_functions/show_toast.dart';

class AddSizeProvider extends ChangeNotifier {
  bool isLoading = false;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isSizeValidated = true;
  bool isStockValidated = true;
  bool isRecievingPriceValidated = true;
  bool isSellingPriceValidated = true;
  bool isDiscountPriceValidated = true;

// validations
  void receivingPriceValidation(String value) {
    if (value.isEmpty && value.length < 2) {
      isRecievingPriceValidated = false;
      notifyListeners();
    } else {
      isRecievingPriceValidated = true;
      notifyListeners();
    }
  }

  void sellingPriceValidation(String value) {
    if (value.isEmpty && value.length < 2) {
      isSellingPriceValidated = false;
      notifyListeners();
    } else {
      isSellingPriceValidated = true;
      notifyListeners();
    }
  }

  void discountPriceValidation(String value) {
    if (value.isEmpty && value.length < 2) {
      isDiscountPriceValidated = false;
      notifyListeners();
    } else {
      isDiscountPriceValidated = true;
      notifyListeners();
    }
  }

  void sizeValidation(String value) {
    if (value.isEmpty && value.length < 2) {
      isSizeValidated = false;
      notifyListeners();
    } else {
      isSizeValidated = true;
      notifyListeners();
    }
  }

  void stockValidation(String value) {
    if (value.isEmpty && value.length < 2) {
      isStockValidated = false;
      notifyListeners();
    } else {
      isStockValidated = true;
      notifyListeners();
    }
  }

// to add a new size
  Future<void> addSize(
      {required String recievingPrice,
      required String sellingPrice,
      required String discountPrice,
      required String size,
      required String stock,
      required String categoryId,
      required String productId,
      required String variantID}) async {
    try {
      isLoading = true;
      notifyListeners();

      final productRef = await firestore.collection("sizes").add({
        "variant_id": variantID,
        "category_id": categoryId,
        "product_id": productId,
        "size": size,
        "stock": stock,
        "recieving_price": recievingPrice,
        "selling_price": sellingPrice,
        "discount_price": discountPrice
      });

      final sizeId = productRef.id;
      await productRef.update({"size_id": sizeId});
      isLoading = false;
      notifyListeners();
      showToast("size added successfully");
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e.toString());
    }
  }

  // to add a new size
  Future<void> updateSize(
      {required String recievingPrice,
      required String sellingPrice,
      required String discountPrice,
      required String size,
      required String stock,
      required String categoryId,
      required String productId,
      required String variantID,
      required String sizeId}) async {
    try {
      isLoading = true;
      notifyListeners();

      await firestore.collection("sizes").doc(sizeId).update({
        "variant_id": variantID,
        "category_id": categoryId,
        "product_id": productId,
        "size": size,
        "stock": stock,
        "recieving_price": recievingPrice,
        "selling_price": sellingPrice,
        "discount_price": discountPrice
      });

      isLoading = false;
      notifyListeners();
      showToast("size added successfully");
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e.toString());
    }
  }

  void reset() {
    isSizeValidated = true;
    isStockValidated = true;
    isRecievingPriceValidated = true;
    isSellingPriceValidated = true;
    isDiscountPriceValidated = true;
    notifyListeners();
  }
}
