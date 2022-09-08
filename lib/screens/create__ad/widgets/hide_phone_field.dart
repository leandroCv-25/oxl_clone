import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/observables/create_ad_store/create_ad_store.dart';

class HidePhoneField extends StatelessWidget {
  const HidePhoneField({Key? key, required this.createAdStore})
      : super(key: key);

  final CreateAdStore createAdStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(builder: (_) {
            return Checkbox(
              value: createAdStore.hidePhone,
              onChanged: (value) {
                if (value != null) {
                  createAdStore.setHidePhone(value);
                }
              },
              activeColor: Theme.of(context).primaryColor,
            );
          }),
          Expanded(
            child: Text(
              'Ocultar o meu telefone neste anúncio',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}
