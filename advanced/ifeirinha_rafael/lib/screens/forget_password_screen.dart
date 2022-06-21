import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/widgets/headers/custom_header.dart';
import 'package:ifeirinha_rafael/widgets/forms/forget_password_form.dart';
import 'package:ifeirinha_rafael/widgets/app_bars/custom_app_bar.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CustomHeader(
                title: 'Esqueci Minha Senha',
                subtitle:
                    'Digite o seu e-mail para receber o código de validação',
              ),
              ForgetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
