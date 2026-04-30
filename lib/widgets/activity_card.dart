import 'package:flutter/material.dart';
import '../models/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isDark;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const ActivityCard({
    super.key,
    required this.activity,
    required this.isDark,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    // Definindo tons de verde baseados no estado
    final Color cardColor = isDark 
        ? (activity.isCompleted ? Colors.grey[850]! : Colors.green[900]!.withOpacity(0.3))
        : (activity.isCompleted ? Colors.green[50]! : Colors.green[100]!);

    final Color textColor = isDark ? Colors.white : Colors.green[900]!;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          activity.title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            decoration: activity.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Botão de apagar (Lixeira) - Disponível antes e depois de concluir
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 22),
              onPressed: onDelete,
            ),
            // Botão de concluir
            IconButton(
              icon: Icon(
                activity.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                color: Colors.green,
              ),
              onPressed: onToggle,
            ),
          ],
        ),
      ),
    );
  }
}