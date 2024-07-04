import 'package:ecommerce_app/src/feature/product/presentation/controllers/product_controller.dart';
import 'package:ecommerce_app/src/feature/product/presentation/widgets/product_card.dart';
import 'package:ecommerce_app/src/feature/product/presentation/widgets/product_list_loading_widget.dart';
import 'package:ecommerce_app/src/feature/product/presentation/widgets/product_page_appbar.dart';
import 'package:ecommerce_app/src/feature/product/presentation/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final RefreshController refreshController = RefreshController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductController>(context, listen: false)
          .fetchAllProducts(onRefresh: true);
    });
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
        body: RefreshWidget(
          scrollController: scrollController,
          refreshController: refreshController,
          onRefresh: onRefresh,
          onLoading: onLoading,
          child: Consumer<ProductController>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const ProductListLoadingWidget();
              } else if (value.products.isEmpty) {
                return const Center(
                  child: Text('Products are empty'),
                );
              }
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
      ),
    );
  }

  Future<void> onRefresh() async {
    await Provider.of<ProductController>(context, listen: false)
        .fetchAllProducts(onRefresh: true);
    refreshController.refreshCompleted();
  }

  Future<void> onLoading() async {
    List value = await Provider.of<ProductController>(context, listen: false)
        .fetchAllProducts();
    if (value[0] >= value[1]) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }
}
