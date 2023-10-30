import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timart_app/model/products.dart';

class ProductsController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var productLists = await Product().select().toList();
    products.assignAll(productLists);
  }

  void addProducts(Product product) async {
    try {
      final result = await product.save();
      if (result! > 0) {
        products.add(product);
        fetchProducts();
        Get.snackbar('success', 'Product has been added');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add product');
    }
  }

  void deleteProducts(Product product) async {
    await product.delete();
    fetchProducts();
    const SnackBar(content: Text('Product has been deleted'));
  }

  updateProduct(Product product) async {
    try {
      final result = await product.save();
      if (result != null && result > 0) {
        fetchProducts();
        Get.snackbar('Success', 'Product updated successfully');
      } else {
        Get.snackbar('Error', 'Unable to update product');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
