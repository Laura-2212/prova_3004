import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/fitness_provider.dart';
import '../widgets/activity_card.dart';

class ActivitiesPage extends StatefulWidget { // Mudamos para StatefulWidget para controlar o estado da view
  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  final TextEditingController _taskController = TextEditingController();
  bool _isGridView = false; // Controle de qual visualização usar

  @override
  Widget build(BuildContext context) {
    final fitness = context.watch<FitnessProvider>();
    final isDark = fitness.isDarkMode;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _taskController,
            style: TextStyle(color: isDark ? Colors.white : Colors.black),
            decoration: InputDecoration(
              hintText: "minha nova tarefa é....",
              hintStyle: TextStyle(color: isDark ? Colors.white60 : Colors.black38),
              filled: true,
              fillColor: isDark ? Colors.white10 : Colors.green[50],
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              suffixIcon: IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: () {
                  fitness.addActivity(_taskController.text);
                  _taskController.clear();
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Botão para alternar entre Lista e Grade
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Visualização:", style: TextStyle(color: isDark ? Colors.white70 : Colors.grey)),
              IconButton(
                icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view, color: Colors.green),
                onPressed: () => setState(() => _isGridView = !_isGridView),
              ),
            ],
          ),
          _title("Pendentes", isDark),
          Expanded(
            child: _isGridView 
                ? _buildGrid(fitness.pendingActivities, isDark, fitness) 
                : _buildList(fitness.pendingActivities, isDark, fitness),
          ),
          const Divider(),
          _title("Concluídas", isDark),
          Expanded(
            child: _buildList(fitness.completedActivities, isDark, fitness), // Mantive lista para concluídas para economizar espaço
          ),
        ],
      ),
    );
  }

  // Widget para renderizar o ListView
  Widget _buildList(List activities, bool isDark, FitnessProvider fitness) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final a = activities[index];
        return ActivityCard(
          activity: a,
          isDark: isDark,
          onToggle: () => fitness.toggleActivityStatus(a.id),
          onDelete: () => fitness.deleteActivity(a.id),
        );
      },
    );
  }

  // Widget para renderizar o GridView
  Widget _buildGrid(List activities, bool isDark, FitnessProvider fitness) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 colunas
        childAspectRatio: 1.5, // Ajusta a altura do card
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final a = activities[index];
        return ActivityCard( // O ActivityCard será adaptado dentro do Grid
          activity: a,
          isDark: isDark,
          onToggle: () => fitness.toggleActivityStatus(a.id),
          onDelete: () => fitness.deleteActivity(a.id),
        );
      },
    );
  }

  Widget _title(String t, bool dark) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text(t, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: dark ? Colors.white : Colors.green[800])),
  );
}