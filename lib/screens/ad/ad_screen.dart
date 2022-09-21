import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/ad.dart';
import 'components/bottom_bar.dart';
import 'components/description_panel.dart';
import 'components/location_panel.dart';
import 'components/main_panel.dart';
import 'components/user_panel.dart';

class AdScreen extends StatelessWidget {
  const AdScreen(this.ad, {super.key});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anúncio"),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 280,
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.0,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                  ),
                  items: ad.images
                      .map((item) => AspectRatio(
                            aspectRatio: 2,
                            child: Card(
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                child: Image(
                                  image: CachedNetworkImageProvider(item),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainPanel(ad),
                    Divider(color: Colors.grey[500]),
                    DescriptionPanel(ad),
                    Divider(color: Colors.grey[500]),
                    LocationPanel(ad),
                    Divider(color: Colors.grey[500]),
                    UserPanel(ad),
                    SizedBox(
                      height: ad.status == AdStatus.pending ? 16 : 120,
                    ),
                  ],
                ),
              ),
            ],
          ),
          BottomBar(ad),
        ],
      ),
    );
  }
}
