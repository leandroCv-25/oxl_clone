import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  const PriceField(
      {super.key, this.label, required this.onChanged, this.initialValue});

  final String? label;
  final Function(int) onChanged;
  final int? initialValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          prefixText: 'R\$ ',
          border: const OutlineInputBorder(),
          isDense: true,
          labelText: label,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter(moeda: false),
        ],
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.bodyText2,
        onChanged: (text) {
          onChanged(int.tryParse(text.replaceAll('.', ''))!);
        },
        initialValue: initialValue?.toString(),
      ),
    );
  }
}
