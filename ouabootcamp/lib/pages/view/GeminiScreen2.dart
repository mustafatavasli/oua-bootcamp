import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:ouabootcamp/pages/view/IntroScreen.dart'; // IntroScreen dosyanızın yolunu ekleyin

class GuestCardScreen2 extends StatefulWidget {
  @override
  State<GuestCardScreen2> createState() => _GuestCardScreen2State();
}

class _GuestCardScreen2State extends State<GuestCardScreen2> {
  // Gemini API
  GenerateContentResponse? response;
  final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: "AIzaSyB_TZpCKvhIjoOlaq1FZp7wuEp-FUmDvt4",
      generationConfig: GenerationConfig(
        temperature: 0.5,
      ));

  String prompt = "Her seferinde farklı bir hastalık hakkında 2 paragraflık bilgi ver";

  Future<void> _tryGeminiAI() async {
    final content = [Content.text(prompt)];
    final res = await model.generateContent(content);

    if (!mounted) return; // Eğer widget artık ağacın bir parçası değilse, setState çağrılmamalı

    setState(() {
      response = res;
    });
  }

  @override
  void initState() {
    super.initState();
    _tryGeminiAI(); // Sayfa yüklendiğinde API çağrısını yap
  }

  @override
  void dispose() {
    // Burada zamanlayıcıyı iptal edebilir veya animasyonu durdurabilirsiniz
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => IntroScreen()),
            ); // IntroScreen sayfasına yönlendir
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoşgeldin Misafir',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.published_with_changes_outlined),
                  Text(
                    'Uygulamamıza tam erişim için \nkayıt olmayı unutmayın.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                color: Color.fromRGBO(254, 226, 249, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('Hastalık Bülteni', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),),
                      subtitle: Text(response?.text ?? ""),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
