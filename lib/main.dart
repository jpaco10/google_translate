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
      debugShowCheckedModeBanner: false,
      title: 'Google Translation App',
      home: TranslationPage(),
    );
  }
}

class TranslationPage extends StatefulWidget {
  const TranslationPage({Key? key}) : super(key: key);

  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  String _inputText = '';
  String _translatedText = '';
  final TextEditingController _textEditingController = TextEditingController();

  void _translateText() {
    _inputText.translate().then((translatedText) {
      setState(() {
        _translatedText = translatedText;
      });
    });
  }

  void _clearFields() {
    setState(() {
      _inputText = '';
      _translatedText = '';
      _textEditingController.clear();
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
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: 'Ingresa una palabra',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              ),
              onChanged: (value) {
                setState(() {
                  _inputText = value;
                });
              },
            ),
            SizedBox(height: 40),
            TextField(
              readOnly: true, // Para hacer el campo de texto no editable
              controller: TextEditingController(text: '$_translatedText'),
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                border:
                    OutlineInputBorder(), // Agrega un borde alrededor del campo de texto
                labelText:
                    'Traducción:', // Agrega una etiqueta al campo de texto
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _translateText,
              child: Text('TRADUCIR'),
            ),
            ElevatedButton(
              onPressed: _clearFields,
              child: Text('LIMPIAR CAMPOS'),
            ),
          ],
        ),
      ),
    );
  }
}
