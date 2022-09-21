import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../models/ad.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(this.ad, {super.key});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    if (ad.status == AdStatus.pending) return Container();

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Colors.orange,
            ),
            child: Row(
              children: [
                if (!ad.hidePhone)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        final phone =
                            ad.user.phone?.replaceAll(RegExp('[^0-9]'), '');
                        launchUrlString('tel:$phone');
                      },
                      child: Container(
                        height: 25,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black45),
                          ),
                        ),
                        child: Text('Ligar',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: Colors.white)),
                      ),
                    ),
                  ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 25,
                      alignment: Alignment.center,
                      child: Text(
                        'Chat',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(249, 249, 249, 1),
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            height: 38,
            alignment: Alignment.center,
            child: Text(
              '${ad.user.name} (anunciante)',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
