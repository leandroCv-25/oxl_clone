import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/screens/myads/components/pending_tile.dart';
import 'package:olx_clone/screens/myads/components/sold_tile.dart';

import '../../observables/myAds/my_ads.dart';
import '../../widgets/empty_card.dart';
import 'components/active_tile.dart';


//

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key, this.initialPage = 0});

  final int initialPage;

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  final MyAds myAds = MyAds();
  TabController? tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Anúncios'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Theme.of(context).secondaryHeaderColor,
          tabs: const [
            Tab(child: Text('ATIVOS')),
            Tab(child: Text('PENDENTES')),
            Tab(child: Text('VENDIDOS')),
          ],
        ),
      ),
      body: Observer(builder: (_) {
        if (myAds.loading) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          );
        }
        return TabBarView(
          controller: tabController,
          children: [
            Observer(builder: (_) {
              if (myAds.activeAds.isEmpty) {
                return const EmptyCard('Você não possui nenhum anúncio ativo.');
              }

              return ListView.builder(
                itemCount: myAds.activeAds.length,
                itemBuilder: (_, index) {
                  return ActiveTile(myAds.activeAds[index], myAds: myAds,);
                },
              );
            }),
            Observer(builder: (_) {
              if (myAds.pendingAds.isEmpty) {
                return const EmptyCard(
                    'Você não possui nenhum anúncio pendente.');
              }

              return ListView.builder(
                itemCount: myAds.pendingAds.length,
                itemBuilder: (_, index) {
                  return PendingTile(myAds.pendingAds[index]);
                },
              );
            }),
            Observer(builder: (_) {
              if (myAds.soldAds.isEmpty) {
                return const EmptyCard(
                    'Você não possui nenhum anúncio vendido.');
              }

              return ListView.builder(
                itemCount: myAds.soldAds.length,
                itemBuilder: (_, index) {
                  return SoldTile(myAds.soldAds[index], myAds);
                },
              );
            }),
          ],
        );
      }),
    );
  }
}
