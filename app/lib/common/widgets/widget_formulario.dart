import 'package:flutter/material.dart';

class WidgetFormulario extends StatefulWidget {
  final String? texto;
  final String? hind;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  const WidgetFormulario({
    this.texto,
    super.key,
    this.hind,
    this.controller,
    this.padding,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.helperText,
  });

  @override
  State<WidgetFormulario> createState() => _WidgetFormularioState();
}

class _WidgetFormularioState extends State<WidgetFormulario> {
  String? _helperText;

  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            setState(() {
              _helperText = null;
            });
          }
        },
        cursorColor: Colors.black,
        validator: widget.validator,
        obscureText: widget.obscureText ?? false,
        controller: widget.controller,
        decoration: InputDecoration(
          errorMaxLines: 3,
          helperMaxLines: 3,
          helperText: _helperText,
          hintText: widget.hind,
          labelText: widget.texto,
          labelStyle: const TextStyle(color: Colors.black),
          suffixIcon: widget.suffixIcon,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
        ),
      ),
    );
  }
}
