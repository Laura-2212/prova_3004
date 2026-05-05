import 'package:flutter/material.dart';
import '../models/activity_model.dart';

class AppState extends ChangeNotifier {
  String _nomeUsuario = "";
  int _metaSemanal = 0;
  bool _isDarkMode = false;
  int _selectedIndex = 0;
  // Lista de atividades, pode ser pré-populada com algumas atividades padrão ou começar vazia

  List<Atividade> _atividades = []; // Inicia vazio, pode ser preenchido com atividades padrão se desejar

  // Getters
  String get nomeUsuario => _nomeUsuario;
  int get metaSemanal => _metaSemanal;
  bool get isDarkMode => _isDarkMode;
  int get selectedIndex => _selectedIndex;
  List<Atividade> get pendentes => _atividades.where((a) => !a.concluida).toList();
  List<Atividade> get concluidas => _atividades.where((a) => a.concluida).toList();
  // Setters e métodos para manipular o estado

  // Métodos
  void definirNome(String nome) => { _nomeUsuario = nome, notifyListeners() };
  
  void definirMeta(int meta) => { _metaSemanal = meta, notifyListeners() };

  void setSelectedIndex(int index) => { _selectedIndex = index, notifyListeners() };

  void adicionarTarefa(String nome) {
    if (nome.isNotEmpty) {
      _atividades.add(Atividade(nome: nome));
      notifyListeners();
    }
  }
  // Método para concluir uma atividade

  void concluirAtividade(Atividade atividade) {
    atividade.concluida = true;
    notifyListeners();
  }
// Método para excluir uma atividade
  void toggleTheme() => { _isDarkMode = !_isDarkMode, notifyListeners() };

  void redefinirTudo() {
    _atividades = []; // Limpa as atividades
    _metaSemanal = 0; // Reseta a meta semanal para o valor padrão
    _nomeUsuario = ""; // Reseta o nome do usuário
    _isDarkMode = false; // Reseta o tema para claro
    _selectedIndex = 0; // Reseta a página selecionada para a primeira
    notifyListeners();
  }  // Outros métodos para manipular o estado podem ser adicionados aqui
}