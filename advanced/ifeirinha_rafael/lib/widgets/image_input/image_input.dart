import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(width: 1, color: Colors.grey[400]!),
          shape: BoxShape.circle,
        ),
        child: image == null
            ? const Icon(
                Icons.add_a_photo,
                size: 40,
              )
            : ClipOval(child: Image.file(File(image!.path))),
      ),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              final imagePicker = ImagePicker();
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        child: ListTile(
                          title: Text(
                            'Galeria',
                            style: GoogleFonts.roboto(),
                          ),
                          trailing: const Icon(Icons.image),
                          onTap: () async {
                            final pickedImage = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (pickedImage == null) {
                              return;
                            }
                            setState(() => image = pickedImage);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Material(
                        child: ListTile(
                          title: Text(
                            'Camera',
                            style: GoogleFonts.roboto(),
                          ),
                          trailing: const Icon(Icons.camera_alt),
                          onTap: () async {
                            final pickedImage = await imagePicker.pickImage(
                              source: ImageSource.camera,
                              preferredCameraDevice: CameraDevice.front,
                            );
                            if (pickedImage == null) {
                              return;
                            }
                            setState(() => image = pickedImage);
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            backgroundColor: Theme.of(context).colorScheme.primary);
      },
    );
  }
}
