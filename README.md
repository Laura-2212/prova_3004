# prova_3004

A new Flutter project.

# Link do figma
https://www.figma.com/proto/jZDjRYxgWbFcks4VeFpAm6/Sem-t%C3%ADtulo?node-id=0-1&t=Wl97TafDpxWw5gKH-1 
## 2. Gerenciamento de Estado (fitness_provider.dart)
Utiliza a classe ChangeNotifier para gerenciar os dados globais do app, como informações do usuário, tema e a lista de atividades.

Principais Funcionalidades:
Getters: Filtram atividades pendentes e concluídas em tempo real.

Cálculo de Calorias: Baseado no número de atividades concluídas (20 kcal por item).

Ações: Adicionar, excluir, alternar status (concluído/pendente) e atualizar perfil.

Reset: Função resetProgress() que limpa todos os dados para o estado inicial.

## 3. Componentes de Interface (Widgets)
ActivityCard (activity_card.dart)
Widget responsável por exibir individualmente cada tarefa.

Dinâmica de Cores: Altera o tom de verde/cinza dependendo do modo (claro/escuro) e do status da tarefa.

Interações: Possui botões para deletar a tarefa e para marcar como concluída.

DashboardStats (dashboard_stats.dart)
Exibe o resumo do progresso do usuário no topo da tela inicial.

Mostra contador de concluídas vs pendentes.

Exibe calorias queimadas e meta semanal.

HelpSection (help_section.dart)
Uma seção de FAQ (perguntas frequentes) que utiliza ExpansionTile para organizar informações de ajuda de forma compacta.

## 4. Telas Principais
MainScaffold (main.dart)
O coração da navegação do app.

BottomNavigationBar: Alterna entre as abas "Início", "Atividades" e "Ajustes".

Integração de Tema: O MaterialApp observa o isDarkMode do Provider para alternar entre ThemeData.light() e ThemeData.dark().

Diálogos de Edição: Contém funções auxiliares para abrir pop-ups de edição de nome e meta.

ActivitiesPage (activities_screen.dart)
A tela de gerenciamento de tarefas.

Entrada de Dados: TextField com botão de adição rápida.

Modos de Visualização: Suporta alternância dinâmica entre:

ListView: Ideal para leitura detalhada e listas longas.

GridView: Ideal para uma visão panorâmica em blocos (colunas).