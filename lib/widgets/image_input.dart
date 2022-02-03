import 'package:flutter/material.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

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
              onPressed: () {},
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
