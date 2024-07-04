import 'package:ecommerce_app/src/feature/product/presentation/widgets/refresh_widget_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({
    super.key,
    required this.child,
    required this.onRefresh,
    required this.onLoading,
    required this.refreshController,
    required this.scrollController,
  });

  final Widget child;
  final Future<void> Function() onRefresh;
  final Future<void> Function() onLoading;
  final RefreshController refreshController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return KRefreshWidgetConfig(
      child: SmartRefresher(
        controller: refreshController,
        physics: const BouncingScrollPhysics(),
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: child,
      ),
    );
  }
}
