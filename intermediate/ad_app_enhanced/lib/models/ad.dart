import 'package:image_picker/image_picker.dart';

class Ad {
  late String title, description;
  late double price;
  late XFile? image;

  Ad(
      {required this.title,
      required this.description,
      required this.price,
      this.image});

  @override
  String toString() {
    return "Title of the service/product: $title\nDescription: $description\nPrice: \$$price";
  }

  String toShareMsg() {
    return "Hey, I have seen something interesting. Please, take a look:\n${this}";
  }
}
