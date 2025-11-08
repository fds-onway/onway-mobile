import 'package:flutter/material.dart';
import 'package:onway/util/extensions/build_context_extensions.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool enableSuggestions;
  final String? Function(String?)? validator;
  const TextFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.enableSuggestions = false,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      validator: widget.validator,
      enableSuggestions: widget.enableSuggestions,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        fillColor: context.colorScheme.outlineVariant.withAlpha(80),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
