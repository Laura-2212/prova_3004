import 'package:flutter/material.dart';

class HelpSection extends StatelessWidget {
  final bool isDark;
  const HelpSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Ajuda", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
          const SizedBox(height: 20),
          ExpansionTile(
            title: Text("Como funciona o app?", style: TextStyle(color: textColor)),
            children: [Padding(padding: EdgeInsets.all(8.0), child: Text("Você pode adicionar tarefas, marcá-las como concluídas e acompanhar seu progresso.", style: TextStyle(color: textColor.withOpacity(0.7))))],
          ),
          ExpansionTile(
            title: Text("Quero mudar o tema", style: TextStyle(color: textColor)),
            children: [Padding(padding: EdgeInsets.all(8.0), child: Text("Vá em Configurações e use o interruptor de modo escuro.", style: TextStyle(color: textColor.withOpacity(0.7))))],
          ),
        ],
      ),
    );
  }
}