import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/widgets/custom_code_input/custom_code_input_entity.dart';

class CustomCodeInput extends StatefulWidget {
  const CustomCodeInput({Key? key}) : super(key: key);

  @override
  CustomCodeInputState createState() => CustomCodeInputState();
}

class CustomCodeInputState extends State<CustomCodeInput> {
  final textFormField1Controller = TextEditingController();
  final textFormField2Controller = TextEditingController();
  final textFormField3Controller = TextEditingController();
  final textFormField4Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  late FocusNode textFormField1FocusNode;
  late FocusNode textFormField2FocusNode;
  late FocusNode textFormField3FocusNode;
  late FocusNode textFormField4FocusNode;

  @override
  void initState() {
    super.initState();
    textFormField1FocusNode = FocusNode();
    textFormField2FocusNode = FocusNode();
    textFormField3FocusNode = FocusNode();
    textFormField4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    textFormField1FocusNode.dispose();
    textFormField2FocusNode.dispose();
    textFormField3FocusNode.dispose();
    textFormField4FocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSizer = ScreenSizer(context);
    screenSizer.adjustHeightIfDeviceIsiOS();
    return Container(
      margin: EdgeInsets.only(
        top: screenSizer.convertToDeviceScreenHeight(
          screenPercentage: ScreenPercentage.marginTopFormContainer,
        ),
      ),
      child: Form(
        key: formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCodeInputEntity(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (textFormField2Controller.text.isEmpty) {
                    textFormField2FocusNode.requestFocus();
                  } else if (textFormField3Controller.text.isEmpty) {
                    textFormField3FocusNode.requestFocus();
                  } else if (textFormField4Controller.text.isEmpty) {
                    textFormField4FocusNode.requestFocus();
                  } else {
                    textFormField2FocusNode.requestFocus();
                  }
                }
              },
              focusNode: textFormField1FocusNode,
              controller: textFormField1Controller,
              autofocus: true,
            ),
            CustomCodeInputEntity(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (textFormField1Controller.text.isEmpty) {
                    textFormField1FocusNode.requestFocus();
                  } else if (textFormField3Controller.text.isEmpty) {
                    textFormField3FocusNode.requestFocus();
                  } else if (textFormField4Controller.text.isEmpty) {
                    textFormField4FocusNode.requestFocus();
                  } else {
                    textFormField3FocusNode.requestFocus();
                  }
                }
              },
              focusNode: textFormField2FocusNode,
              controller: textFormField2Controller,
            ),
            CustomCodeInputEntity(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (textFormField1Controller.text.isEmpty) {
                    textFormField1FocusNode.requestFocus();
                  } else if (textFormField2Controller.text.isEmpty) {
                    textFormField2FocusNode.requestFocus();
                  } else {
                    textFormField4FocusNode.requestFocus();
                  }
                }
              },
              focusNode: textFormField3FocusNode,
              controller: textFormField3Controller,
            ),
            CustomCodeInputEntity(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (textFormField1Controller.text.isEmpty) {
                    textFormField1FocusNode.requestFocus();
                  } else if (textFormField2Controller.text.isEmpty) {
                    textFormField2FocusNode.requestFocus();
                  } else if (textFormField3Controller.text.isEmpty) {
                    textFormField3FocusNode.requestFocus();
                  } else {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                }
              },
              focusNode: textFormField4FocusNode,
              controller: textFormField4Controller,
            ),
          ],
        ),
      ),
    );
  }

  bool isCodeValid(String code) {
    return !(code.length != 4 || code.contains('.'));
  }

  void cleanForm() {
    textFormField1Controller.text = '';
    textFormField2Controller.text = '';
    textFormField3Controller.text = '';
    textFormField4Controller.text = '';
  }

  String getCode() {
    return textFormField1Controller.text +
        textFormField2Controller.text +
        textFormField3Controller.text +
        textFormField4Controller.text;
  }
}
