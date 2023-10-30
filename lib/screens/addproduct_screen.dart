import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timart_app/config/products_config.dart';
import 'package:timart_app/model/products.dart';
import 'package:timart_app/screens/productlist_screen.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key, this.product});
  final productController = Get.put(ProductsController());
  final product;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController sellingPriceController = TextEditingController();
  final TextEditingController costPriceController = TextEditingController();
  final TextEditingController productImageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'product name',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.blue, width: 2)))),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(
                  labelText: 'Enter quantity',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.blue, width: 2))),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: sellingPriceController,
              decoration: const InputDecoration(
                  labelText: 'Enter selling price',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.blue, width: 2))),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: costPriceController,
              decoration: const InputDecoration(
                  labelText: 'Enter cost price',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.blue, width: 2))),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: productImageController,
              decoration: const InputDecoration(
                  labelText: 'Enter Image URL',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.blue, width: 2))),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
                onPressed: () {
                  final product = Product(
                      name: nameController.text,
                      quantity: int.parse(quantityController.text),
                      costPrice: int.parse(costPriceController.text),
                      sellingPrice: int.parse(sellingPriceController.text),
                      productImage: productImageController.text);

                  productController.addProducts(product);
                  Get.back();
                },
                child: const Text('Add Product')),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () => Get.to(ProductListScreen()),
                child: const Text('View Products'))
          ],
        ),
      ),
    );
  }
}
