import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timart_app/config/products_config.dart';
import 'package:timart_app/screens/addproduct_screen.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});
  final productController = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Obx(() {
        return ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              final product = productController.products[index];
              return ListTile(
                leading: CircleAvatar(child: Text('')),
                title: Text(product.name.toString()),
                subtitle: Column(children: [
                  Text('Cost price:${product.costPrice}'),
                  Text('Selling price:${product.sellingPrice}'),
                  Text('Quantity:${product.quantity}'),
                ]),
                trailing: Row(children: [
                  IconButton(
                      onPressed: () {
                        Get.to(() => AddProductScreen(product: product));
                      },
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        productController.deleteProducts(product);
                      },
                      icon: const Icon(Icons.delete))
                ]),
              );
            });
      }),
    );
  }
}
