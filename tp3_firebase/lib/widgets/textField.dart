import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required TextEditingController controller,
    required String labelText,
    required bool isMdp,
    final String? errorText
  }) : _controller = controller,
        _labelText = labelText,
        _isMdp = isMdp,
        _errorText = errorText;

  final TextEditingController _controller;
  final String _labelText;
  final bool _isMdp;
  final String? _errorText;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: _labelText,
        errorText: _errorText,
      ),
      obscureText: _isMdp,
    );
  }
}