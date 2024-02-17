import 'package:flutter/material.dart';

class AppScrollView extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPagination;

  /// Метод, вызываемый при обновлении страницы (если null - рефреша страницы нет)
  final Future<void> Function()? onRefresh;

  const AppScrollView({
    required this.child,
    this.onPagination,
    this.onRefresh,
    super.key,
  });

  @override
  State<AppScrollView> createState() => _AppScrollViewState();
}

class _AppScrollViewState extends State<AppScrollView> {
  late final controller = ScrollController()..addListener(_scrollListener);

  _scrollListener() {
    if (controller.position.pixels >
        controller.position.maxScrollExtent - 150) {
      widget.onPagination?.call();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onRefresh != null) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return RefreshIndicator.adaptive(
            displacement: 20,
            color: Colors.blueAccent,
            onRefresh: widget.onRefresh!,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: _scrollWidget(),
            ),
          );
        },
      );
    }

    return _scrollWidget();
  }

  Widget _scrollWidget() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: controller,
      child: widget.child,
    );
  }
}
