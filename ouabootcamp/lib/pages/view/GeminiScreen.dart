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

  final myController = TextEditingController();
  String prompt = "";

  void _tryGeminiAI() {
    prompt = myController.text;
    // setState() async olduğu için error veriyor, sorun değil.
    setState(() async {
      final content = [Content.text(prompt)];
      response = await model.generateContent(content);
    });
  }

  @override
  void dispose() {
    myController.dispose();
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
                'Hoşgeldin,\nMisafir',
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
              SizedBox(height: 16),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  labelText: 'Ask to Gemini',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Card(
                child: Text(response?.text ?? ""),
              )
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
