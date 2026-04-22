import 'package:go_router/go_router.dart';

//screens
import 'package:oasis/app/features/home/screens/home_screen.dart';
import 'package:oasis/app/features/products/createProducts/screens/create_product_screen.dart';
import 'package:oasis/app/features/products/productList/screens/product_list_screen.dart';

import 'package:oasis/app/shared/layouts/main_layout.dart';

//Routes
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,

  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },

      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const HomeScreen(),
        ),

        GoRoute(
          path: AppRoutes.createProducto,
          builder: (context, state) => const CreateProductScreen(),
        ),

        GoRoute(
          path: AppRoutes.productList,
          builder: (context, state) => const ProductListScreen(),
        ),
      ],
    ),
  ],
);
