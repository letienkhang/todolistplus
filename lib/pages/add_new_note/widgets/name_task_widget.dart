import 'package:flutter/material.dart';

class NameTaskWidget extends StatelessWidget {
  NameTaskWidget({Key? key, required this.titleTaskController})
      : super(key: key);

  var titleTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: titleTaskController,
        cursorColor: theme.primaryColor,
        decoration: InputDecoration(
          labelText: "Title",
          labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor),
          fillColor: theme.primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: theme.primaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
