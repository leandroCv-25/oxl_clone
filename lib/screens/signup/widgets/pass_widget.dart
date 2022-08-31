import 'package:flutter/material.dart';

class PassWidget extends StatelessWidget {
  const PassWidget({Key? key, required this.grade}) : super(key: key);

  final int grade;

  final double _height = 16;
  final double _radius = 8;
  final MaterialColor _colorEnable = Colors.green;
  final MaterialColor _colorDisable = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 32, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_radius),
                color: grade >= 1 ? _colorEnable : _colorDisable,
              ),
              height: _height,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_radius),
                color: grade >= 2 ? _colorEnable : _colorDisable,
              ),
              height: _height,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_radius),
                color: grade >= 3 ? _colorEnable : _colorDisable,
              ),
              height: _height,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_radius),
                color: grade >= 4 ? _colorEnable : _colorDisable,
              ),
              height: _height,
            ),
          ),
        ],
      ),
    );
  }
}
