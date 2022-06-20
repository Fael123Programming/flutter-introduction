import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/models/forms/validation_code_form.dart';
import 'package:ifeirinha_rafael/models/app_bars/custom_app_bar.dart';
import 'package:ifeirinha_rafael/models/headers/custom_header.dart';

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
