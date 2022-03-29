import 'package:flutter/material.dart';

class DescriptionTaskWidget extends StatelessWidget {
   DescriptionTaskWidget({Key? key, required this.taskController}) : super(key: key);
  var taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 120,
      child: TextFormField(
        controller: taskController,
        keyboardType: TextInputType.multiline,
        cursorColor: theme.primaryColor,
        minLines: 4,
        maxLines: 6,
        decoration: InputDecoration(
          labelText: "Description",
          labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor),
          fillColor: theme.primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color:theme.primaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
