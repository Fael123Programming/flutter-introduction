import 'package:api_rest/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:api_rest/helper/sign_in_helper.dart';
import 'package:api_rest/screens/home_screen.dart';
import 'package:api_rest/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInHelper signInHelper = SignInHelper();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (await signInHelper.isUserSignedIn()) {
      final sharedPreferences = await SharedPreferences.getInstance();
      final userService = UserService();
      User? user = await userService.getUserByUsername(
        sharedPreferences.getString('username')!,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            userSignedIn: user,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('API Rest'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                    labelText: 'Username', labelStyle: TextStyle(fontSize: 18)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Cannot be null or empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Password', labelStyle: TextStyle(fontSize: 18)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Cannot be null or empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      User? user = await signInHelper.signIn(
                        usernameController.text,
                        passwordController.text,
                      );
                      if (user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              userSignedIn: user,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Check username and password and try again'),
                            backgroundColor: Colors.blue,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
