import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/widgets/forms/validation_code_form.dart';
import 'package:ifeirinha_rafael/widgets/app_bars/custom_app_bar.dart';
import 'package:ifeirinha_rafael/widgets/headers/custom_header.dart';

class ValidationCodeScreen extends StatefulWidget {
  const ValidationCodeScreen({Key? key}) : super(key: key);

  @override
  _ValidationCodeScreenState createState() => _ValidationCodeScreenState();
}

class _ValidationCodeScreenState extends State<ValidationCodeScreen> {
  final textFormField1Controller = TextEditingController();
  final textFormField2Controller = TextEditingController();
  final textFormField3Controller = TextEditingController();
  final textFormField4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CustomHeader(
                title: 'Código de Validação',
                subtitle:
                    'Digite o código de 4 dígitos que foi enviado para seu e-mail',
              ),
              ValidationCodeForm(),
            ],
          ),
        ),
      ),
    );
  }
}
