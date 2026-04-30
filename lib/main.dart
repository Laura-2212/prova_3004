import 'package:flutter/material.dart';
import 'package:prova_3004/widgets/help_section.dart';
import 'package:provider/provider.dart';
import 'provider/fitness_provider.dart';
import 'pages/activities_screen.dart';
import 'widgets/dashboard_stats.dart';

void main() => runApp(ChangeNotifierProvider(
  create: (_) => FitnessProvider(),
  child: const MyApp(),
));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final fitness = context.watch<FitnessProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, primarySwatch: Colors.green),
      darkTheme: ThemeData(brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black),
      themeMode: fitness.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const MainScaffold(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});
  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}




class _MainScaffoldState extends State<MainScaffold> {
  int _idx = 0;

  @override
  Widget build(BuildContext context) {
    final fitness = context.watch<FitnessProvider>();
    final isDark = fitness.isDarkMode;

    final List<Widget> pages = [
      _buildDashboard(fitness, isDark),
      ActivitiesPage(),
      _buildSettings(fitness, isDark),
      HelpSection(isDark: isDark), // Nova tela adicionada
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("FIT LIFE"),
        actions: [
          IconButton(icon: const Icon(Icons.help_outline), onPressed: () => setState(() => _idx = 3))
        ],
      ),
      body: pages[_idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx > 2 ? 0 : _idx, // Mantém o foco visual se estiver na ajuda
        onTap: (i) => setState(() => _idx = i),
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Atividades"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ajustes"),
        ],
      ),
    );
  }

  Widget _buildDashboard(FitnessProvider f, bool dark) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        // Agora mostra o nome dinâmico!
        Text("Olá, ${f.userName}!", style: TextStyle(fontSize: 18, color: dark ? Colors.white : Colors.black)),
        const SizedBox(height: 10),
        DashboardStats(completed: f.completedActivities.length, pending: f.pendingActivities.length, calories: f.calories, isDark: dark, goal: f.weeklyGoal),
        const SizedBox(height: 30),
        ElevatedButton(onPressed: () => setState(() => _idx = 1), child: const Text("Adicionar Atividade")),
      ]),
    );
  }

  Widget _buildSettings(FitnessProvider f, bool dark) {
    return SingleChildScrollView(
      child: Column(children: [
        ListTile(
          leading: const CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.person, color: Colors.white)),
          title: Text(f.userName, style: TextStyle(color: dark ? Colors.white : Colors.black)),
          trailing: const Icon(Icons.edit, size: 20),
          onTap: () => _showNameDialog(context, f),
        ),
        SwitchListTile(
          title: Text("mudar tema", style: TextStyle(color: dark ? Colors.white : Colors.black)),
          secondary: const Icon(Icons.brightness_6),
          value: f.isDarkMode,
          onChanged: (_) => f.toggleTheme(),
        ),
        ListTile(
          leading: const Icon(Icons.flag_outlined, color: Colors.green),
          title: Text("defina sua meta semanal", style: TextStyle(color: dark ? Colors.white : Colors.black)),
          subtitle: Text("Atual: ${f.weeklyGoal}"),
          onTap: () => _showGoalDialog(context, f),
        ),
        const ListTile(
          leading: Icon(Icons.notifications_none),
          title: Text("notificação"),
        ),
        const SizedBox(height: 20),
        // BOTÃO REDEFINIR (Frame 5)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
              onPressed: () {
                f.resetProgress();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Todo o progresso foi resetado!"))
                );
              },
              child: const Text("redefinir", style: TextStyle(color: Colors.black)),
            ),
          ),
        ),
      ]),
   

    );
  }

  // DIÁLOGO PARA O NOME FUNCIONAR
  void _showNameDialog(BuildContext context, FitnessProvider f) {
    final controller = TextEditingController(text: f.userName);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Editar Nome"),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancelar")),
          ElevatedButton(
            onPressed: () {
              f.updateUserName(controller.text);
              Navigator.pop(ctx);
            }, 
            child: const Text("Salvar")
          ),
        ],
      ),
    );
  }
}

  // DIÁLOGO PARA EDITAR META
  void _showGoalDialog(BuildContext context, FitnessProvider f) {
    final controller = TextEditingController(text: f.weeklyGoal.toString());
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Meta Semanal"),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: "Ex: 2500"),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancelar")),
          ElevatedButton(
            onPressed: () {
              f.updateGoal(int.tryParse(controller.text) ?? f.weeklyGoal);
              Navigator.pop(ctx);
            }, 
            child: const Text("Salvar")
          ),
        ],
      ),
    );
  }