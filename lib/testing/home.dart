import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svg_flutter/svg.dart';
import 'package:upgrader/upgrader.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
 final upgrader = Upgrader(
            debugDisplayAlways: true,
            storeController: UpgraderStoreController(
              onAndroid: () => UpgraderPlayStore(),
              oniOS: () => UpgraderAppStore(),
            ),
          );
    return Stack(
      children: [
        Image.asset('assets/bg.jpg'),
        UpgradeAlert(
          showIgnore: false,
          showLater: false,
          upgrader: upgrader,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  expandedHeight: 200,
                  backgroundColor: Colors.transparent,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  flexibleSpace: FlexibleSpaceBar(),
                ),
                SliverToBoxAdapter(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                      ),
                      Positioned(
                          top: -100,
                          child: SvgPicture.asset(
                            'assets/cloud.svg',
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
