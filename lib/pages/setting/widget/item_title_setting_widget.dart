import 'package:flutter/material.dart';

class ItemTitleSettingWidget extends StatelessWidget {
  final IconData icon;
  final String btnText;
  final Widget trailing;
  final Function onPressed;

  const ItemTitleSettingWidget(
      {Key? key,
      required this.icon,
      required this.btnText,
      required this.trailing,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed(),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            const SizedBox(width: 20),
            Text(
              btnText,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor),
            ),
            const SizedBox(width: 160),
            Container(
              child: trailing,
            )
          ],
        ),
      ),
    );
  }
}
