import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import '../models/ad.dart';

class RegisterScreen extends StatefulWidget {
  final Ad? ad;
  final bool editing;

  const RegisterScreen({Key? key, this.ad, this.editing = false})
      : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? image;

  @override
  void initState() {
    super.initState();
    if (widget.ad == null) {
      //If we have created this screen without passing it an ad, that is, we do not want to edit but create one.
      return;
    }
    setState(
      () {
        //If we have created this screen for editing an existing ad we will have to bring all its data into the text inputs.
        titleController.text = widget.ad!.title;
        descriptionController.text = widget.ad!.description;
        priceController.text = widget.ad!.price.toString();
        image = widget.ad!.image;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //Avoid the keyboard of passing over the couple of buttons.
      appBar: AppBar(
        title: Text(
          (widget.ad == null ? "New" : "Edit") + " Ad",
          style: const TextStyle(
            fontFamily: "Arial",
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          const Material(
                            child: ListTile(
                              title: Center(
                                child: Text("Choose where to pick from"),
                              ),
                              tileColor: Colors.grey,
                            ),
                          ),
                          Material(
                            child: ListTile(
                              onTap: () async {
                                var filePickerResult =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.image,
                                );
                                String? filePath;
                                if (filePickerResult != null) {
                                  filePath =
                                      filePickerResult.files[0].path.toString();
                                  setState(
                                    () => image = File(filePath!),
                                  );
                                  Navigator.pop(context);
                                }
                                print(
                                    "*****************************************");
                                print(filePath);
                                print(filePickerResult);
                                print(
                                    "*****************************************");
                              },
                              title: const Center(
                                child: Text("Gallery"),
                              ),
                              tileColor: Colors.grey[300],
                            ),
                          ),
                          Material(
                            child: ListTile(
                              title: const Center(
                                child: Text("Camera"),
                              ),
                              tileColor: Colors.grey[300],
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Container(
                          //       margin: const EdgeInsets.symmetric(
                          //         horizontal: 10,
                          //         vertical: 20,
                          //       ),
                          //       child: ElevatedButton(
                          //         child: const Text("Gallery"),
                          //         onPressed: () async {
                          //           final ImagePicker picker = ImagePicker();
                          //           final XFile? pickedFile = await picker
                          //               .pickImage(source: ImageSource.gallery);
                          //           if (pickedFile != null) {
                          //             setState(
                          //               () => image = File(pickedFile.path),
                          //             );
                          //             Navigator.pop(context);
                          //           }
                          //         },
                          //       ),
                          //     ),
                          //     Container(
                          //       margin: const EdgeInsets.symmetric(
                          //         horizontal: 10,
                          //         vertical: 20,
                          //       ),
                          //       child: ElevatedButton(
                          //         child: const Text("Camera"),
                          //         onPressed: () async {
                          //           final ImagePicker picker = ImagePicker();
                          //           final XFile? pickedFile = await picker
                          //               .pickImage(source: ImageSource.camera);
                          //           if (pickedFile != null) {
                          //             setState(
                          //               () => image = File(pickedFile.path),
                          //             );
                          //             Navigator.pop(context);
                          //           }
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  width: 1,
                  color: Colors.grey[400]!,
                ),
                shape: BoxShape.rectangle,
              ),
              child: image == null
                  ? const Icon(
                      Icons.add_a_photo,
                      size: 40,
                    )
                  : Image.asset(
                      image!.path,
                    ),
            ),
          ),
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          String valueStr = value.toString();
                          if (valueStr.isEmpty) {
                            return "A title is necessary";
                          }
                          return null; //Return null means it is nice.
                        },
                        maxLength: 30,
                        decoration: const InputDecoration(
                          labelText: "Title",
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: "Arial",
                          fontSize: 18,
                        ),
                        controller: titleController,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          String valueStr = value.toString();
                          if (valueStr.isEmpty) {
                            return "A description is necessary";
                          }
                          return null; //If description is valid, all good.
                        },
                        maxLength: 50,
                        decoration: const InputDecoration(
                          labelText: "Description",
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: "Arial",
                          fontSize: 18,
                        ),
                        controller: descriptionController,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 20,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          String valueStr = value.toString();
                          if (valueStr.isEmpty) {
                            return "A Price is necessary";
                          }
                          double valueDouble = double.parse(valueStr);
                          if (valueDouble <= 0) {
                            return "Price must be greater than zero";
                          }
                          if (valueDouble > 999999999999) {
                            //999 billions is enough.
                            return "Price is too large";
                          }
                          return null; //Value match the requirements!
                        },
                        decoration: const InputDecoration(
                          labelText: "Price",
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: "Arial",
                          fontSize: 18,
                        ),
                        controller: priceController,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 15,
                            ),
                            height: 55,
                            child: ElevatedButton(
                              child:
                                  Text(widget.ad == null ? "Create" : "Edit"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Ad newAd = Ad(
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    price: double.parse(priceController.text),
                                    image: image,
                                  );
                                  Navigator.pop(context, newAd);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(widget.editing
                                          ? "Edited"
                                          : "Created"),
                                      duration: const Duration(
                                        seconds: 1,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 15,
                            ),
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
