import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_state.dart';
import '../pages/help_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos listen: false pois o Drawer apenas dispara ações, não precisa redesenhar o tempo todo
    final appState = Provider.of<AppState>(context, listen: false);

    return Drawer(
      child: Column(
        children: [
          // Cabeçalho do Menu com o nome do usuário vindo do Provider
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 136, 33, 161),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 255, 232, 199),
              child: Icon(Icons.person, size: 40, color: Color.fromARGB(255, 136, 33, 161)),
            ),
            accountName: Consumer<AppState>(
              builder: (context, state, child) => Text(
                state.nomeUsuario.isEmpty ? "Usuário" : state.nomeUsuario,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            accountEmail: const Text("Bem-estar e Saúde"),
          ),

          // Itens do Menu
          ListTile(
            leading: const Icon(Icons.dashboard_outlined),
            title: const Text("Dashboard"),
            onTap: () {
              appState.setSelectedIndex(0); // Muda para a aba Dashboard
              Navigator.pop(context); // Fecha o Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center_outlined),
            title: const Text("Atividades"),
            onTap: () {
              appState.setSelectedIndex(1); // Muda para a aba Atividades
              Navigator.pop(context); // Fecha o Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Configurações"),
            onTap: () {
              appState.setSelectedIndex(2); // Muda para a aba Configurações
              Navigator.pop(context); // Fecha o Drawer
            },
          ),
          
          const Divider(), // Linha divisória

          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text("Ajuda"),
            onTap: () {
              Navigator.pop(context); // Fecha o Drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpPage()),
              );
            },
          ),

          const Spacer(), // Empurra o próximo item para o rodapé

          // Versão do App ou Logout (Opcional)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "v1.0.0",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}