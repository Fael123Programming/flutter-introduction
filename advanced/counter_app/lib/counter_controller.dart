import 'package:get/get.dart';

///A controller class manages the business logic and states of a application.
class CounterController extends GetxController {
  final _num = 0.obs;

  get num => _num.value;

  set num(value) => _num.value = value;

  increment() {
    num++;
  }

  decrement() {
    num--;
  }
}
