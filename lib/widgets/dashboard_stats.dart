import 'package:flutter/material.dart';

class DashboardStats extends StatelessWidget {
  final int completed;
  final int pending;
  final int calories;
  final bool isDark;

  const DashboardStats({
    super.key,
    required this.completed,
    required this.pending,
    required this.calories,
    required this.isDark, required int goal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.green[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Text(
            "progresso da suas atividades",
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: isDark ? Colors.white : Colors.green[800]
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statItem("concluidas", completed, isDark),
              _statItem("pendentes", pending, isDark),
            ],
          ),
          const Divider(height: 30),
          _rowInfo("Calorias", "$calories kcal", isDark),
          _rowInfo("Meta da semana", "2000", isDark),
        ],
      ),
    );
  }

  Widget _statItem(String label, int value, bool isDark) {
    return Column(
      children: [
        Text(value.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
        Text(label, style: TextStyle(color: isDark ? Colors.white70 : Colors.grey[600])),
      ],
    );
  }

  Widget _rowInfo(String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: isDark ? Colors.white70 : Colors.black87)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        ],
      ),
    );
  }
}