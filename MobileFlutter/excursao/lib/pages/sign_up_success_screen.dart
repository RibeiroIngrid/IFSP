import 'package:excursao/constants/colors.dart';
import 'package:excursao/main.dart';
import 'package:excursao/pages/login_form_screen.dart';
import 'package:flutter/material.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,

      appBar: AppBar(
        backgroundColor: AppColors.darkGreen,

        title: const Text(
          'Cadastro Concluído',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text(
              'Cadastro realizado com sucesso!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginFormScreen(),
                  ),
                );
              },
              child: const Text('Fazer Login'),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar ao início'),
            ),
          ],
        ),
      ),
    );
  }
}
