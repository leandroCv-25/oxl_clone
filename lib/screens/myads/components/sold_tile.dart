import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:olx_clone/helpers/extensions.dart';

import '../../../models/ad.dart';
import '../../../observables/myAds/my_ads.dart';

class SoldTile extends StatelessWidget {
  const SoldTile(this.ad, this.store, {super.key});

  final Ad ad;
  final MyAds store;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: ad.images.isEmpty
                    ? 'https://static.thenounproject.com/png/194055-200.png'
                    : ad.images.first,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ad.title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      ad.price.formattedMoney(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  iconSize: 20,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    store.deleteAd(ad);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
