import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/screens/sign_up_screen.dart';
import 'package:ifeirinha_rafael/widgets/forms/sign_in_form.dart';
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
    final screenSizer = ScreenSizer(context);
    return Scaffold(
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
                        screenPercentage: ScreenPercentage.smoothMarginTop,
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
                  const SignInForm(),
                  Container(
                    margin: EdgeInsets.only(
                      top: screenSizer.convertToDeviceScreenHeight(
                        screenPercentage:
                            ScreenPercentage.bigMarginTop,
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
