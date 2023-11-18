import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../pages/product_detail/product_detail_page.dart';
import '../../pages/products/products_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ProductsRoute.page, initial: true),
        AutoRoute(page: ProductDetailRoute.page),
      ];
}
