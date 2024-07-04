import 'package:ecommerce_app/src/config/utils/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class KRefreshWidgetConfig extends StatelessWidget {
  final Widget child;
  const KRefreshWidgetConfig({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => CustomHeader(
        builder: (context, mode) {
          Widget body = gap();
          if (mode == RefreshStatus.idle) {
            body = const RefreshHelperWidget(
              icon: CupertinoIcons.refresh,
              text: "Pull down to refresh",
            );
          } else if (mode == RefreshStatus.refreshing) {
            body = const CupertinoActivityIndicator(radius: 12);
          } else if (mode == RefreshStatus.failed) {
            body = const RefreshHelperWidget(
              icon: CupertinoIcons.clear_circled,
              text: "Failed to load data",
            );
          } else if (mode == RefreshStatus.canRefresh) {
            body = const RefreshHelperWidget(
              icon: CupertinoIcons.capslock,
              text: "Release to load",
            );
          } else if (mode == RefreshStatus.completed) {
            body = const RefreshHelperWidget(
              icon: CupertinoIcons.checkmark_alt_circle,
              text: "Load Completed",
            );
          }
          return SizedBox(
            height: 45.0,
            child: Center(child: body),
          );
        },
      ),
      footerBuilder: () => CustomFooter(
        builder: (context, mode) {
          Widget body = gap();
          if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator(radius: 12);
          } else if (mode == LoadStatus.failed) {
            body = const RefreshHelperWidget(
              icon: CupertinoIcons.clear_circled,
              text: "Failed to load data",
            );
          } else if (mode == LoadStatus.canLoading) {
            body = const RefreshHelperWidget(
              icon: CupertinoIcons.capslock,
              text: "Release to load",
            );
          } else if (mode == LoadStatus.noMore) {
            body = const RefreshHelperWidget(
              icon: CupertinoIcons.checkmark_alt_circle,
              text: "No more data to load",
            );
          }
          return SizedBox(
            height: 60.0,
            child: Center(child: body),
          );
        },
      ),
      enableScrollWhenRefreshCompleted: true,
      enableLoadingWhenFailed: true,
      hideFooterWhenNotFull: false,
      child: child,
    );
  }
}

class RefreshHelperWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const RefreshHelperWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 20,
          color: CupertinoColors.systemGrey2,
        ),
        gap(height: 10),
        Text(
          text,
          style: const TextStyle(
            color: CupertinoColors.systemGrey2,
            height: 1,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
