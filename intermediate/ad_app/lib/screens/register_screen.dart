import 'package:flutter/material.dart';
import 'package:ad_app/models/ad.dart';

class RegisterScreen extends StatefulWidget {
  final Ad? ad;
  final bool? editing;

  const RegisterScreen({Key? key, this.ad, this.editing}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
