import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/models/buttons/big_button.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/models/custom_code_input/custom_code_input.dart';
import 'package:ifeirinha_rafael/screens/redefine_password_screen.dart';

class ValidationCodeForm extends StatefulWidget {
  const ValidationCodeForm({Key? key}) : super(key: key);

  @override
  _ValidationCodeFormState createState() => _ValidationCodeFormState();
}

class _ValidationCodeFormState extends State<ValidationCodeForm> {
  final customCodeInputKey = GlobalKey<CustomCodeInputState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Column(
        children: [
          CustomCodeInput(key: customCodeInputKey),
          BigButton(
            text: 'Continuar',
            onPressed: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              String code = getCode();
              cleanForm();
              if (isCodeValid(code)) {
                if (doesCodeMatch(code)) {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RedefinePasswordScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Código inválido'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Código inválido'),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
              await Future.delayed(const Duration(seconds: 1));
              customCodeInputKey.currentState!.textFormField1FocusNode
                  .requestFocus();
            },
          ),
          BigButton(
            specialWidth: true,
            text: 'Reenviar Código',
            onPressed: () async {
              cleanForm();
              FocusManager.instance.primaryFocus?.unfocus();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Código reenviado com sucesso'),
                  duration: Duration(seconds: 1),
                ),
              );
              await Future.delayed(const Duration(seconds: 1));
              customCodeInputKey.currentState!.textFormField1FocusNode
                  .requestFocus();
            },
          ),
        ],
      ),
    );
  }

  bool isCodeValid(String code) {
    return customCodeInputKey.currentState!.isCodeValid(code);
  }

  void cleanForm() {
    customCodeInputKey.currentState!.cleanForm();
  }

  String getCode() {
    return customCodeInputKey.currentState!.getCode();
  }

  bool doesCodeMatch(String code) {
    return code == '1234';
  }
}
