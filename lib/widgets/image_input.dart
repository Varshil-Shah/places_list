import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class ImageInput extends StatefulWidget {
  ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takeImage() async {
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 600.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 120.0,
          width: 180.0,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey.shade400,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text(
                  "No image taken!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
          alignment: Alignment.center,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Container(
            color: Colors.grey.shade400,
            child: TextButton.icon(
              onPressed: _takeImage,
              label: const Text(
                "Take picture",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              icon: const Icon(Icons.camera),
            ),
          ),
        ),
      ],
    );
  }
}
