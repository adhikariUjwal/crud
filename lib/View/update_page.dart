import 'package:crud/Controllers/user_controller.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  final String id;
  const UpdatePage({super.key, required this.id});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController updateFullNameController = TextEditingController();
  void dispose() {
    updateFullNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Update your details here!'),
            Text(widget.id),
            SizedBox(height: 10),
            TextField(
              controller: updateFullNameController,
              decoration: InputDecoration(
                // errorText: validate ? "Value Can't Be Empty' : null"
                border: OutlineInputBorder(),
                hintText: 'Full Name',
              ),
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    String updateFullName = updateFullNameController.text;
                    UserController().updateUser(widget.id, updateFullName);
                    print(updateFullName);
                  },
                  child: const Text('Update')),
            )
          ],
        ),
      ),
    ));
  }
}
