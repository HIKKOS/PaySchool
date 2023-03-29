import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckBoxLogin extends StatefulWidget {
  @override
  _CheckBoxLoginState createState() => _CheckBoxLoginState();
}

class _CheckBoxLoginState extends State<CheckBoxLogin> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _loadCheckBoxState();
  }

  _loadCheckBoxState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isChecked = (prefs.getBool('isLoggedIn') ?? false);
    });
  }

  _saveCheckBoxState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isChecked = value;
      prefs.setBool('isLoggedIn', value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('Guardar sesión'),
      value: _isChecked,
      onChanged: (value) {
        _saveCheckBoxState(value!);
      },
    );
  }
}
