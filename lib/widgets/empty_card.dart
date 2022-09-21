import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 8,
      margin: const EdgeInsets.all(32),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Icon(
              Icons.border_clear,
              size: 200,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Hmmm...',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
