import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_state.dart';
import '../widgets/custom_drawer.dart';
import 'dashboard_page.dart';
import 'activities_page.dart';
import 'config_page.dart';
import 'help_page.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuta o estado para saber qual aba está selecionada
    final appState = Provider.of<AppState>(context);
    
    // Lista de páginas para navegação
    final List<Widget> _pages = [
      const DashboardPage(),
      const ActivitiesPage(),
      const ConfigPage(),
    ];

    return Scaffold(
      // 1. BARRA SUPERIOR
      appBar: AppBar(
        title: const Text("FIT LIFE"),
        centerTitle: true,
        actions: [
          // Botão de Ajuda Funcional
          IconButton(
            icon: const Icon(Icons.help_outline),
            tooltip: 'Ajuda',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpPage()),
              );
            },
          ),
        ],
      ),

      // 2. MENU LATERAL (DRAWER)
      drawer: const CustomDrawer(),

      // 3. CORPO DINÂMICO (Muda conforme a aba)
      body: IndexedStack(
        index: appState.selectedIndex,
        children: _pages,
      ),

      // 4. BARRA DE NAVEGAÇÃO INFERIOR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: appState.selectedIndex,
        onTap: (index) {
          appState.setSelectedIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_outlined),
            activeIcon: Icon(Icons.fitness_center),
            label: 'Atividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}