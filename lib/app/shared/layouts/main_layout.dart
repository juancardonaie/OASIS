import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

import 'package:go_router/go_router.dart';
import '../../config/router/app_routes.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  final List<String> routes = [
  AppRoutes.home,
  AppRoutes.createProducto,
  AppRoutes.productList,
  // AppRoutes.inventory,
  // AppRoutes.categories,
];

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    context.go(routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,

      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
