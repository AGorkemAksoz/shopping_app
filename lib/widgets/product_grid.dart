import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/prodcuts_provider.dart';

import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;

  const ProductGrid({super.key, required this.showFavs});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProducsProvider>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.list;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      ),
      itemCount: products.length,
    );
  }
}
