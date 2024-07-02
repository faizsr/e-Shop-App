import 'package:ecommerce_app/src/feature/product/presentation/controllers/product_controller.dart';
import 'package:ecommerce_app/src/feature/product/presentation/widgets/product_card.dart';
import 'package:ecommerce_app/src/feature/product/presentation/widgets/product_page_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    Provider.of<ProductController>(context, listen: false).fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: ProductPageAppbar(),
        ),
        body: Consumer<ProductController>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Center(
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: List.generate(
                      value.products.length,
                      (index) => ProductCard(product: value.products[index]),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
