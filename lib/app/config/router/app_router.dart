import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

//screens
import 'package:oasis/app/features/home/screens/home_screen.dart';
import 'package:oasis/app/features/products/createProducts/screens/create_product_screen.dart';

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

      ],

    ),

  ],

);