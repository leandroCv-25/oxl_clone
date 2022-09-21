import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:olx_clone/helpers/extensions.dart';

import '../../../models/ad.dart';
import '../../ad/ad_screen.dart';

class AdTile extends StatelessWidget {
  const AdTile(this.ad, {super.key});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => AdScreen(ad)));
      },
      child: Container(
        height: 127,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Row(
            children: [
              SizedBox(
                height: 127,
                width: 127,
                child: CachedNetworkImage(
                  imageUrl: ad.images.isEmpty
                      ? 'https://static.thenounproject.com/png/194055-200.png'
                      : ad.images.first,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ad.title,
                          style: Theme.of(context).textTheme.bodyText2),
                      Text(ad.price.formattedMoney(),
                          style: Theme.of(context).textTheme.bodyText1),
                      Text(
                          '${ad.created?.formattedDate()} - '
                          '${ad.address.city.name} - '
                          '${ad.address.uf.initials}',
                          style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
