import 'package:flutter/material.dart';
import '../services/Home_Service.dart';
import 'stat_card.dart';

class HomeStatsGrid extends StatelessWidget {
  final HomeStatsModel stats;

  const HomeStatsGrid({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.inventory_2_outlined,
                label: 'Total stock',
                value: '${stats.totalStock}',
                subtitle: '${stats.lowStockProducts.length + (stats.totalStock - stats.lowStockCount)} productos',
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                icon: Icons.warning_amber_rounded,
                label: 'Stock bajo',
                value: '${stats.lowStockCount}',
                subtitle: stats.lowStockCount > 0
                    ? 'Requiere atención'
                    : 'Todo en orden',
                color: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.category_outlined,
                label: 'Categorías',
                value: '${stats.categoriesCount}',
                subtitle: 'Activas',
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                icon: Icons.attach_money_rounded,
                label: 'Valor total',
                value: '\$${_formatNumber(stats.totalValue)}',
                subtitle: 'En inventario',
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatNumber(double value) {
    final parts = value.toStringAsFixed(0).split('');
    final result = StringBuffer();
    for (int i = 0; i < parts.length; i++) {
      if (i > 0 && (parts.length - i) % 3 == 0) result.write('.');
      result.write(parts[i]);
    }
    return result.toString();
  }
}