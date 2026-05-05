import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/app_state.dart';
import 'pages/welcome_page.dart';

void main() => runApp(ChangeNotifierProvider(create: (_) => AppState(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appState.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: const WelcomePage(),
    );
  }
}