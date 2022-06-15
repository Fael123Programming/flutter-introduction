import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/screens/change_password_screen.dart';
import 'package:ifeirinha_rafael/validation/validator.dart';
import 'package:ifeirinha_rafael/screens/sign_up_screen.dart';

//My phone's dimensions:
//width: 411.42857142857144 (411.43)
//height: 866.2857142857143 (866.3)

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
    ScreenSizer screenSizer = ScreenSizer(context);
    screenSizer.adjustHeightIfDeviceIsiOS();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Center(
            child: Container(
              margin: EdgeInsets.only(
                top: screenSizer.convertToDeviceScreenHeight(
                  screenPercentage: ScreenPercentage.marginTopAForthHalfScreen,
                ),
              ),
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
                  Container(
                    margin: EdgeInsets.only(
                      top: screenSizer.convertToDeviceScreenHeight(
                        screenPercentage:
                            ScreenPercentage.marginTopAFifthHalfScreen,
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.roboto(
                        fontSize: 34,
                        fontWeight: FontWeight.w400,
                      ),
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
                  Container(
                    margin: EdgeInsets.only(
                      top: screenSizer.convertToDeviceScreenHeight(
                        screenPercentage:
                            ScreenPercentage.marginTopFormContainer,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenSizer.convertToDeviceScreenHeight(
                        screenPercentage:
                            ScreenPercentage.formContainerVerticalPadding,
                      ),
                      horizontal: screenSizer.convertToDeviceScreenWidth(
                        screenPercentage:
                            ScreenPercentage.formContainerHorizontalPadding,
                      ),
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
                                Validator.validateEmail(email),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: screenSizer.convertToDeviceScreenHeight(
                                screenPercentage: ScreenPercentage
                                    .marginInbetweenTextFormFields,
                              ),
                            ),
                            child: TextFormField(
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
                                  Validator.validatePassword(password),
                            ),
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
                      margin: EdgeInsets.only(
                        right: screenSizer.convertToDeviceScreenWidth(
                          screenPercentage: ScreenPercentage.smoothMarginRight,
                        ),
                      ),
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
                    margin: EdgeInsets.only(
                      top: screenSizer.convertToDeviceScreenHeight(
                        screenPercentage: ScreenPercentage.bigButtonMarginTop,
                      ),
                    ),
                    width: screenSizer.convertToDeviceScreenWidth(
                      screenPercentage: ScreenPercentage.bigButtonWidth,
                    ),
                    height: screenSizer.convertToDeviceScreenHeight(
                      screenPercentage: ScreenPercentage.bigButtonHeight,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              screenSizer.convertToDeviceScreenWidth(
                                screenPercentage:
                                    ScreenPercentage.bigButtonRadius,
                              ),
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        'Entrar',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
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
                    margin: EdgeInsets.only(
                      top: screenSizer.convertToDeviceScreenHeight(
                        screenPercentage:
                            ScreenPercentage.marginTopAForthHalfScreen,
                      ),
                    ),
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
