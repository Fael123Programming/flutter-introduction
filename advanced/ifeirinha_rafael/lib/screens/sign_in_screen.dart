import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/screens/change_password_screen.dart';
import 'package:ifeirinha_rafael/validation/sign_in_validator.dart';
import 'package:ifeirinha_rafael/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  IconData passwordIconData = Icons.visibility_outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Text(
                    'Bem Vindo a',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 48,
                    ),
                  ),
                  Text(
                    'IFeirinha!',
                    style: GoogleFonts.oleoScript(
                      color: const Color.fromRGBO(255, 178, 15, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 48,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Login',
                    style: GoogleFonts.roboto(
                      fontSize: 34,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Entre, é de graça',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          TextFormField(
                            cursorColor: Colors.black,
                            autofocus: true,
                            controller: emailController,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(),
                              border: OutlineInputBorder(),
                              hintText: 'E-mail',
                              hintStyle: TextStyle(color: Colors.grey),
                              isDense: true,
                            ),
                            validator: (email) =>
                                SignInValidator.validateEmail(email),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            cursorColor: Colors.black,
                            obscureText: obscurePassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              errorBorder: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(),
                              border: const OutlineInputBorder(),
                              hintText: 'Senha',
                              hintStyle: const TextStyle(color: Colors.grey),
                              isDense: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscurePassword = !obscurePassword;
                                    if (obscurePassword) {
                                      passwordIconData =
                                          Icons.visibility_outlined;
                                    } else {
                                      passwordIconData =
                                          Icons.visibility_off_outlined;
                                    }
                                  });
                                },
                                icon: Icon(passwordIconData),
                              ),
                            ),
                            validator: (password) =>
                                SignInValidator.validatePassword(password),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ChangePasswordScreen('Esqueci Minha Senha'),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 40),
                      alignment: Alignment.topRight,
                      child: const Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: 209,
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      child: Text(
                        'Entrar',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Entrar'),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 190),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Não tem uma conta? '),
                          TextSpan(
                            text: 'Cadastre-se',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
