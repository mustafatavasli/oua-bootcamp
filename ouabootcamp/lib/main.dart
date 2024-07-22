import 'package:flutter/material.dart';
import 'package:ouabootcamp/pages/view/SplashScreen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const SaglikPusulasi());
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class SaglikPusulasi extends StatelessWidget {
  const SaglikPusulasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sağlık Pusulası',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:splashScreen(),
    );
  }
}
