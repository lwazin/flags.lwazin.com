import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardWidget extends StatefulWidget {
  String assetName;
  CardWidget(this.assetName);
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.black38,
        child: Image.network(
          widget.assetName,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
