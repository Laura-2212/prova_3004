# prova_3004

## link do figma
https://www.figma.com/proto/jZDjRYxgWbFcks4VeFpAm6/Sem-t%C3%ADtulo?node-id=0-1&t=ipwf5ze42d1NTVMc-1 
 ## 1. Arquitetura do Projeto
O projeto foi estruturado seguindo o padrão de separação de responsabilidades (Clean Code), facilitando a manutenção e leitura:

Models: Definição das classes de dados.

Providers: Lógica de negócio e estado.

Pages: Telas principais do sistema.

Widgets: Componentes reutilizáveis de interface.

## 2. Gerenciamento de Estado (app_state.dart)
Utiliza o pacote Provider com ChangeNotifier para centralizar o controle de dados sem a necessidade de passar parâmetros manualmente entre telas.

Principais Funcionalidades:

Filtros em Tempo Real: Getters que separam a lista mestre de atividades em pendentes e concluidas.

Sincronização de Perfil: Armazena o nome do usuário e a meta semanal definidos na entrada ou ajustes.

Sistema de Tema: Variável booleana isDarkMode que injeta o estilo visual em toda a árvore de widgets.

Persistência de Ação: Métodos para adicionar tarefas personalizadas, marcar como concluído e redefinir o progresso total.

## 3. Componentes de Interface (Widgets)
ActivityTile (activity_tile.dart)
Widget responsável por exibir a atividade de forma compacta.

Visual: Estilo "pílula" cinza seguindo o protótipo do Figma.

Feedback: Ícones dinâmicos que mudam de estado (checkbox vazio para check preenchido) ao interagir.

CustomDrawer (custom_drawer.dart)
Menu lateral para navegação secundária.

Cabeçalho Dinâmico: Exibe o nome do usuário em tempo real usando um Consumer.

Links Rápidos: Atalhos para Dashboard, Atividades, Configurações e Ajuda.

HelpSection (help_page.dart)
Central de suporte ao usuário.

Organização: Utiliza ExpansionTile para criar um FAQ sanfonado, economizando espaço em tela.

## 4. Telas Principais
WelcomePage (welcome_page.dart)
Porta de entrada do aplicativo.

Fluxo: Captura o nome do usuário via TextField e o salva no Provider antes de liberar o acesso à navegação principal.

MainNavigation (main.dart / main_navigation.dart)
O hub central do aplicativo.

BottomNavigationBar: Gerencia a troca de abas entre Dashboard, Atividades e Ajustes.

IndexedStack: Técnica utilizada para manter o estado das telas (scroll e inputs) salvo ao alternar entre as abas.

DashboardPage (dashboard_page.dart)
Painel de indicadores de desempenho.

Layout: Organizado em blocos de informação (Cards).

Métricas: Exibe o total de calorias calculadas, o percentual da meta semanal e o resumo de tarefas.

ActivitiesPage (activities_page.dart)
A tela de interação principal para os exercícios.

TabBarView: Divide a visualização entre tarefas "Pendentes" e "Concluídas".

Input Dinâmico: Campo de texto no topo que permite a criação de novas tarefas personalizadas instantaneamente.