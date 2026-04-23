import 'package:flutter/material.dart';
import '../services/Home_Service.dart';
import '../widgets/home_header.dart';
import '../widgets/home_stats_grid.dart';
import '../widgets/low_stock_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeService = HomeService();

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<HomeStatsModel>(
          stream: homeService.getHomeStats(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Error al cargar el inventario'));
            }

            final stats = snapshot.data!;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),
                  const SizedBox(height: 24),
                  HomeStatsGrid(stats: stats),
                  const SizedBox(height: 32),
                  if (stats.lowStockProducts.isNotEmpty)
                    LowStockList(products: stats.lowStockProducts),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}