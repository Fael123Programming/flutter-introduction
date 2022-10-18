import 'package:flutter/material.dart';
import 'package:greet_app/views/home/widgets/standard_text_style.dart';
import 'package:greet_app/views/home/widgets/changeable_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changeableTextKey = GlobalKey<ChangeableTextState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to Greet App',
          style: standardTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: ChangeableText(
          key: changeableTextKey,
          texts: const [
            'Olá Pessoal!', //Portuguese.
            'Bonjour à Tous', //French.
            'Hello Everyone!', //English.
            'Hola a Todos!', //Spanish.
            'Ciao a Tutti!', //Italian.
            'सभी को नमस्कार', //Hindi.
            'أهلا بالجميع', //Arabic.
            'Hallo Zusammen', //German.
            'こんにちは、みんな', //Japanese.
            '大家好', //Chinese.
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeableTextKey.currentState!.changeString(),
        backgroundColor: Colors.amberAccent,
        tooltip: 'Switch language',
        child: const Icon(Icons.swap_vertical_circle),
      ),
    );
  }
}
