import 'package:flutter/material.dart';
import 'package:saglik_pusulasi/pages/IntroScreen.dart';

void main() {
  runApp(const SaglikPusulasi());
}

class SaglikPusulasi extends StatelessWidget {
  const SaglikPusulasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sağlık Pusulası',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IntroScreen(),
    );
  }
}
