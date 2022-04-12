import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController alcoholController = TextEditingController();
  final TextEditingController gasController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Gas-Alcohol Percentage Analyzer"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                width: 100,
                height: 100,
                child: const Image(
                  image: AssetImage("images/gas.png"),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  controller: alcoholController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Alcohol Value",
                    prefix: Text("\$"),
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  controller: gasController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Gas Value",
                    prefix: Text("\$"),
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: 50,
                width: 200,
                child: ElevatedButton(
                  child: const Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: () {
                    String alcoholValueStr = alcoholController.text;
                    String gasValueStr = gasController.text;
                    String report;
                    if (alcoholValueStr.isEmpty || gasValueStr.isEmpty) {
                      report = "Please, enter valid numbers";
                    } else {
                      double alcoholValueParsed = double.parse(alcoholValueStr);
                      double gasValueParsed = double.parse(gasValueStr);
                      if (alcoholValueParsed <= 0 || gasValueParsed <= 0) {
                        report = "Only values greater than zero";
                      } else {
                        double calculusRes =
                            alcoholValueParsed / gasValueParsed;
                        report = "Fuel it with ";
                        if (calculusRes < 0.7) {
                          report += "alcohol";
                        } else {
                          report += "gas";
                        }
                        report += " (" + calculusRes.toStringAsFixed(2) + ")";
                      }
                    }
                    alcoholController.text = "";
                    gasController.text = "";
                    FocusScope.of(context).unfocus();
                    setState(() {
                      result = report;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  result,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
