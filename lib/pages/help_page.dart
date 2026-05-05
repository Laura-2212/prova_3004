import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Central de Ajuda"),
        backgroundColor: const Color.fromARGB(255, 136, 33, 161),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Dúvidas Frequentes",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildHelpItem(
            "Como adicionar uma tarefa?",
            "Vá na aba 'Atividades', digite o nome do exercício no campo de texto e clique no ícone de '+' azul.",
          ),
          _buildHelpItem(
            "Como concluir um exercício?",
            "Na lista de 'Pendentes', clique no círculo ao lado do nome da atividade. Ela será movida para 'Concluídas'.",
          ),
          _buildHelpItem(
            "Onde vejo meu progresso?",
            "No seu 'Dashboard', você encontra o resumo de calorias, tempo e metas.",
          ),
          _buildHelpItem(
            "Como mudar o tema?",
            "Acesse 'Ajustes' no menu inferior e ative a chave 'Mudar Tema'.",
          ),
        ],
      ),
    );
  }

  Widget _buildHelpItem(String title, String content) {
    return Card(
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(content),
          ),
        ],
      ),
    );
  }
}