import 'package:flutter/material.dart';

class MyCustomBadge extends StatelessWidget {
  const MyCustomBadge(
      {super.key,
      required this.text,
      this.icon,
      this.size = "sm",
      required this.outlined,
      required this.color,
      required this.borderColor,
      this.iconColor = Colors.yellow});
  final String? size;
  final String text;
  final IconData? icon;
  final bool outlined;
  final Color color;
  final Color borderColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    Widget returnWidget =
        const Text("An error occured while loading the widget..");

    switch (size) {
      case "xs":
        returnWidget = Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side:
                  outlined ? BorderSide(color: borderColor) : BorderSide.none),
          elevation: 5,
          color: color,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 6, vertical: icon == null ? 3 : 4),
            child: icon != null
                ? Row(children: [
                    Icon(
                      icon,
                      color: iconColor,
                    ),
                    Text(
                      text,
                      style: TextStyle(fontSize: 12, color: borderColor),
                    )
                  ])
                : Text(
                    text,
                    style: TextStyle(fontSize: 12, color: borderColor),
                  ),
          ),
        );
      case "sm":
        returnWidget = Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side:
                  outlined ? BorderSide(color: borderColor) : BorderSide.none),
          elevation: 5,
          color: color,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4, vertical: icon != null ? 0 : 4),
            child: icon != null
                ? Row(children: [
                    Icon(
                      icon,
                      color: iconColor,
                    ),
                    Text(
                      text,
                      style: TextStyle(fontSize: 14, color: borderColor),
                    )
                  ])
                : Text(
                    text,
                    style: TextStyle(fontSize: 14, color: borderColor),
                  ),
          ),
        );
      default:
    }

    return returnWidget;
  }
}
