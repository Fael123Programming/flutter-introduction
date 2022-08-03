import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:counter_app/counter_controller.dart';

class CounterScreen extends GetWidget {
  @override
  final CounterController controller = Get.put(CounterController());

  CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GetX<CounterController>(
              builder: (_) => Text(
                _.num.toString(),
              ),
            ),
            SizedBox(
              height: 300,
              width: 345,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () => controller.increment(),
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.add, color: Colors.green),
                  ),
                  const SizedBox(height: 30),
                  FloatingActionButton(
                    onPressed: () => controller.decrement(),
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.remove, color: Colors.red),
                  )
                ],
              ),
            )
          ],
        ),
        backgroundColor: Colors.blue[400],
      ),
    );
  }
}
