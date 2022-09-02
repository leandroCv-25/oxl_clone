import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key, required this.image, required this.onDelete})
      : super(key: key);

  final dynamic image;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.file(image),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onDelete();
            },
            child: const Text('Excluir'),
          )
        ],
      ),
    );
  }
}
