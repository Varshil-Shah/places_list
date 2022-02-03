import 'package:flutter/material.dart';
import 'package:places_list/widgets/image_input.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({Key? key}) : super(key: key);
  static const String routeName = "/add-place";

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new place"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        label: Text("Title"),
                      ),
                      controller: _titleController,
                    ),
                    const SizedBox(height: 10.0),
                    ImageInput(),
                  ],
                ),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Text(
              "Add place",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey[400],
              padding: const EdgeInsets.symmetric(vertical: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}
