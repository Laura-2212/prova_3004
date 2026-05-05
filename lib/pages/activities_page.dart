import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_state.dart';
import '../widgets/activity.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  // O Controller precisa de estar num StatefulWidget para gerir o texto corretamente
  final TextEditingController _controller = TextEditingController();

  void _adicionar(BuildContext context) {
    final text = _controller.text;
    if (text.isNotEmpty) {
      // listen: false porque é uma função de clique (ação)
      Provider.of<AppState>(context, listen: false).adicionarTarefa(text);
      _controller.clear(); // Limpa o campo
      FocusScope.of(context).unfocus(); // Fecha o teclado
    }
  }

  @override
  Widget build(BuildContext context) {
    // Aqui ouvimos as mudanças nas listas
    final appState = Provider.of<AppState>(context);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Color.fromARGB(255, 136, 33, 161),
            indicatorColor: Color.fromARGB(255, 136, 33, 161),
            tabs: [Tab(text: "Pendentes"), Tab(text: "Concluídas")],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // ABA PENDENTES
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "minha nova tarefa é....",
                          filled: true,
                          fillColor: const Color.fromARGB(255, 184, 184, 184),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.add_circle, color: Color.fromARGB(255, 136, 33, 161)),
                            onPressed: () => _adicionar(context),
                          ),
                        ),
                        onSubmitted: (_) => _adicionar(context),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: appState.pendentes.length,
                        itemBuilder: (context, index) {
                          final item = appState.pendentes[index];
                          return ActivityTile(
                            key: ValueKey(item.nome + index.toString()),
                            atividade: item,
                            onComplete: () => appState.concluirAtividade(item),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                // ABA CONCLUÍDAS
                ListView.builder(
                  itemCount: appState.concluidas.length,
                  itemBuilder: (context, index) {
                    return ActivityTile(atividade: appState.concluidas[index]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}