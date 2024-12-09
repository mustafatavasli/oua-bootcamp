import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GuestCardScreen extends StatefulWidget {
  @override
  State<GuestCardScreen> createState() => _GuestCardScreenState();
}

class _GuestCardScreenState extends State<GuestCardScreen> {
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
      response = await model.generateContent(content);

      setState(() {});

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                color: Color.fromRGBO(251, 236, 241,1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('Hastalık Bülteni',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 0.5),),
                      subtitle: Text(response?.text ?? ""),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Colors.blueAccent,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {},
          items: [
            Icon(
              Icons.home,
              size: 30,
            ),
            IconButton(
              icon: Icon(Icons.question_mark_outlined),
              onPressed: _tryGeminiAI,
            ),
            Icon(
              Icons.person_outline_rounded,
              size: 30,
            ),
          ]),
    );
  }
}
