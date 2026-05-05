import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: const Color.fromARGB(255, 224, 138, 217), borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Olá, ${appState.nomeUsuario}!", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            const Divider(),
            Text("Concluídas: ${appState.concluidas.length} | Pendentes: ${appState.pendentes.length}", style: const TextStyle(color: Colors.black)),
            const SizedBox(height: 10),
            Text("Meta Semanal: ${appState.metaSemanal} kcal\nNível: Médio", style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}