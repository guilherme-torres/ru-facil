import 'package:app_flutter/common/widgets/widget_formulario.dart';
import 'package:flutter/material.dart';

class Passwordformfield extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? texto;
  final String? hind;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  const Passwordformfield({
    super.key,
    this.controller,
    this.padding,
    this.texto,
    this.hind,
    this.suffixIcon,
    this.validator,
    this.helperText,
  });

  @override
  State<Passwordformfield> createState() => _PasswordformfieldState();
}

class _PasswordformfieldState extends State<Passwordformfield> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return WidgetFormulario(
      helperText: widget.helperText,
      validator: widget.validator,
      obscureText: isHidden,
      texto: widget.texto,
      controller: widget.controller,
      padding: widget.padding,
      hind: widget.hind,
      suffixIcon: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Material(
          color: Colors.white,
          child: Ink(
            child: InkWell(
              borderRadius: BorderRadius.circular(28.0),
              child: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
              onTap: () {
                setState(() {
                  isHidden = !isHidden;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
