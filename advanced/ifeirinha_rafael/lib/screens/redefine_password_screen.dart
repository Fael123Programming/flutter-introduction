import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/models/headers/custom_header.dart';
import 'package:ifeirinha_rafael/models/app_bars/custom_app_bar.dart';
import 'package:ifeirinha_rafael/models/forms/new_password_form.dart';

class RedefinePasswordScreen extends StatelessWidget {
  const RedefinePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Center(
          child: Column(
            children: const [
              CustomHeader(
                title: 'Nova Senha',
                subtitle: 'Digite sua nova senha abaixo',
              ),
              NewPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
