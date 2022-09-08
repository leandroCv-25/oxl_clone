import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      this.hint,
      this.prefix,
      this.suffix,
      this.maxLines = 1,
      this.obscure = false,
      required this.textInputType,
      required this.onChanged,
      required this.enabled,
      this.controller,
      this.title,
      this.subtitle,
      this.errorText,
      this.inputFormatters})
      : super(key: key);

  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool enabled;
  final String? title;
  final Widget? subtitle;
  final String? errorText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Text(
                title ?? "",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle ?? Container()
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: prefix != null
                    ? const EdgeInsets.symmetric(horizontal: 32)
                    : const EdgeInsets.only(left: 16),
                child: TextField(
                  inputFormatters: inputFormatters,
                  maxLines: maxLines,
                  controller: controller,
                  obscureText: obscure,
                  keyboardType: textInputType,
                  onChanged: onChanged,
                  enabled: enabled,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    prefixIcon: prefix,
                    suffixIcon: suffix,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                ),
              ),
              Text(
                errorText ?? "",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
