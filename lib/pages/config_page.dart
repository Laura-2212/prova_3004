import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_state.dart';
import 'welcome_page.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SwitchListTile(title: const Text("Mudar Tema"), value: appState.isDarkMode, onChanged: (_) => appState.toggleTheme()),
          ListTile(
            title: const Text("Defina sua meta semanal"),
            subtitle: Text("${appState.metaSemanal} kcal"),
            onTap: () => appState.definirMeta(appState.metaSemanal + 10),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              appState.redefinirTudo();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const WelcomePage()));
            },
            child: const Text("redefinir"),
          ),
        ],
      ),
    );
  }
}