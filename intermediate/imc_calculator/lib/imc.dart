import 'package:flutter/material.dart';

class ImcHome extends StatefulWidget {
  const ImcHome({Key? key}) : super(key: key);

  @override
  _ImcHomeState createState() => _ImcHomeState();
}

class _ImcHomeState extends State<ImcHome> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Image.asset("images/doctor.png"),
                ),
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "Peso",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: pesoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "KG",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "Altura",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: alturaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "Metro",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  double peso = 0, altura = 0;
                  if (pesoController.text.isNotEmpty) {
                    peso = double.parse(pesoController.text);
                  }
                  if (alturaController.text.isNotEmpty) {
                    altura = double.parse(alturaController.text);
                  }
                  if (peso != 0 && altura != 0) {
                    var imc = peso / altura * altura;
                    
                  }
                },
                child: const Text(
                  "Calcular",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Resultado",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.green[700],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
