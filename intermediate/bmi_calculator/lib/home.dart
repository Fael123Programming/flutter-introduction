import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  //Controllers are used to get values from fields.
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Calculate Your BMI"),
        centerTitle: true,
        // backgroundColor: Colors.red,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                width: 80,
                height: 80,
                child: const Image(
                  image: AssetImage("images/doctor.png"),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  controller: heightController, //Linking a controller for it.
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Height",
                    suffixText: "centimeters",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                child: TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Weight",
                    suffixText: "kilograms",
                  ),
                ),
              ),
              ElevatedButton(
                  child:
                      const Text("Calculate", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    String heightStr = heightController.text.toString();
                    String weightStr = weightController.text.toString();
                    String report;
                    if (heightStr.isEmpty || weightStr.isEmpty) {
                      report = "Please, enter valid values";
                    } else {
                      double height = double.parse(heightStr) / 100;
                      double weight = double.parse(weightStr);
                      if (height <= 0 || weight <= 0) {
                        report = "Please, enter valid values";
                      } else {
                        double bmi = weight / (height * height);
                        report =
                            "Your BMI is ${bmi.toStringAsFixed(2)}\nYou are ";
                        if (bmi < 18.5) {
                          report += "underweight";
                        } else if (bmi < 25) {
                          report += "normal";
                        } else if (bmi < 30) {
                          report += "overweight";
                        } else if (bmi < 35) {
                          report += "grade I obesity";
                        } else if (bmi < 40) {
                          report += "grade II obesity (severe)";
                        } else {
                          report += "grade III obesity (morbid)";
                        }
                      }
                    }
                    heightController.text = "";
                    weightController.text = "";
                    FocusScope.of(context).unfocus();
                    setState(() {
                      result = report;
                    });
                  }),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(result,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
