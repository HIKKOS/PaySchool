// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class TextoEditable extends StatelessWidget {

  const TextoEditable ({
    Key? key,
        required this.label,
  }): super(key: key);
    final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(32),
    child: Text(
      label,
      style: const  TextStyle(fontSize: 20, color: Colors.grey),
      softWrap: true,

    ),
    );
  }
}

