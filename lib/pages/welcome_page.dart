import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_state.dart';
import 'main_navigation.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("nome", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: "Como você se chama?"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    context.read<AppState>().definirNome(_controller.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainNavigation()));
                  }
                },
                child: const Text("começar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}