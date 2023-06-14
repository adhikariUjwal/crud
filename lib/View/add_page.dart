import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:crud/Controllers/user_controller.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController fullNameController = TextEditingController();
  bool validate = false;
  ImagePicker picker = ImagePicker();

  @override
  void dispose() {
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            //PageTitle
            const Text('Add User Details',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            //Full Name
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Full Name',
              ),
            ),

            //Submit Button
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ElevatedButton(
                  onPressed: () {
                    String fullName = fullNameController.text;
                    UserController().sendDataToServer(fullName);
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: const Text('Submit')),
            ),
          ],
        ),
      ),
    ));
  }
}
