import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogueBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  // final void Function(String?)? onSave;
  // final FormFieldValidator<String>? validator;

  // TextEditingController text = TextEditingController();


  DialogueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    // required this.validator
  });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[300],
      content: Container(
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new task",
                ),
                maxLines: 2,
                // validator: validator,
                controller: controller,
                // onSaved: onSave;
              ),
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: () => {
                  if(!(controller.text == null || controller.text.isEmpty)){
                    onSave(),
                  }else
                    onCancel(),
                }),

                const SizedBox(width: 8),

                MyButton(text: "cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

