import 'package:flutter/material.dart';
import 'package:google_translate/google_translate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GoogleTranslate.initialize(
    apiKey: "AIzaSyBCiLp9BZ1KSI9hw7pu_Iml3j6R_8D0p8g",
    sourceLanguage: "es",
    targetLanguage: "en",
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Translation App',
      home: TranslationPage(),
    );
  }
}

class TranslationPage extends StatefulWidget {
  const TranslationPage({super.key});

  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  String _inputText = '';
  String _translatedText = '';

  void _translateText() {
    _inputText.translate().then((translatedText) {
      setState(() {
        _translatedText = translatedText;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRADUCTOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /*  TextField(
              decoration:
                  const InputDecoration(labelText: 'Ingresa una palabra'),
              onChanged: (value) {
                setState(() {
                  _inputText = value;
                });
              },
            ), */

            TextField(
              decoration: InputDecoration(
                labelText: 'Ingresa una palabra',
                border:
                    OutlineInputBorder(), // Añade un borde alrededor del campo de texto
                contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal:
                        10), // Ajusta el relleno interno del campo de texto
                // Otros ajustes de estilo aquí, como color del texto, color del borde, etc.
              ),
              onChanged: (value) {
                setState(() {
                  _inputText = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _translateText,
              child: Text('TRADUCIR'),
            ),
            SizedBox(height: 10),
            Text(
              'Traducción: $_translatedText',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
