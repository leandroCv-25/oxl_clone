import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:olx_clone/helpers/extensions.dart';
import '../../../models/ad.dart';
import '../../ad/ad_screen.dart';

class PendingTile extends StatelessWidget {
  const PendingTile(this.ad, {super.key});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => AdScreen(ad)));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        child: SizedBox(
          height: 80,
          child: Row(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: CachedNetworkImage(
                  imageUrl: ad.images.isEmpty
                      ? "https://static.thenounproject.com/png/194055-200.png"
                      : ad.images[0],
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        ad.title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        ad.price.formattedMoney(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Theme.of(context).secondaryHeaderColor,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'AGUARDANDO PUBLICAÇÃO',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
