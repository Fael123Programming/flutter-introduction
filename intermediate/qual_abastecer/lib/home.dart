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
      ),
      body: Column(
        children: [
          const Image(
            image: AssetImage("images/apple.png"),
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
                  ))),
          ElevatedButton(
              child: const Text("Calculate", style: TextStyle(fontSize: 20)),
              onPressed: () {
                double height = double.parse(heightController.text) / 100;
                double weight = double.parse(weightController.text);
                double bmi = weight / (height * height);
                String report = "";
                if (bmi < 18.5) {
                  report = "underweight";
                } else if (bmi < 25) {
                  report = "normal";
                } else if (bmi < 30) {
                  report = "overweight";
                } else {
                  report = "obese";
                }
                setState(() {
                  result = "Your BMI is ${bmi.toStringAsFixed(2)}\n";
                  result += "You are $report";
                });
              }),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Text(result,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
