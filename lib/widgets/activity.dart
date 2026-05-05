import 'package:flutter/material.dart';
import '../models/activity_model.dart';

class ActivityTile extends StatelessWidget {
  final Atividade atividade;
  final VoidCallback? onComplete;

  const ActivityTile({super.key, required this.atividade, this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(atividade.nome, style: const TextStyle(color: Colors.black)),
        trailing: atividade.concluida 
          ? const Icon(Icons.check_circle, color: Colors.green)
          : IconButton(icon: const Icon(Icons.radio_button_unchecked), onPressed: onComplete),
      ),
    );
  }
}