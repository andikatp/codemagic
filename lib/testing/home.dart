import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svg_flutter/svg.dart';
import 'package:upgrader/upgrader.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageIndexNotifier = ValueNotifier(0);

  final upgrader = Upgrader(
    storeController: UpgraderStoreController(
      onAndroid: () => UpgraderPlayStore(),
      oniOS: () => UpgraderAppStore(),
    ),
  );

  SliverWoltModalSheetPage page1(BuildContext modalSheetContext) {
    return WoltModalSheetPage(
      child: SizedBox(
        height: MediaQuery.of(modalSheetContext).size.height * 0.5,
        child: Column(
          children: [
            const Text('page 1'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(
                  () => pageIndexNotifier.value = pageIndexNotifier.value + 1,
                );
              },
              child: const Text('Nexta'),
            ),
          ],
        ),
      ),
    );
  }

  SliverWoltModalSheetPage page2(BuildContext modalSheetContext) {
    return WoltModalSheetPage(
      child: SizedBox(
        height: MediaQuery.of(modalSheetContext).size.height * 0.5,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () =>
                    pageIndexNotifier.value = pageIndexNotifier.value - 1,
                child: const Icon(Icons.chevron_left)),
            const SizedBox(height: 20),
            const Text('page 2'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () => WoltModalSheet.show(
                                pageIndexNotifier: pageIndexNotifier,
                                context: context,
                                pageListBuilder: (modalContext) =>
                                    [page1(modalContext), page2(modalContext)]),
                            child: const Text('Press Me'),

                          ),
                        ),
                      ),
                      Positioned(
                        top: -100,
                        child: SvgPicture.asset(
                          'assets/cloud.svg',
                        ),
                      ),
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
