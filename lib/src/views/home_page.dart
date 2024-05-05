import 'dart:math';
import 'package:flutter/material.dart';
import 'package:color_genrator/src/components/color_list_item.dart';
import 'package:color_genrator/src/models/color_info.dart';
import 'package:firebase_admob/firebase_admob.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? bannerAd;
  BannerAd showBannerAd(){
    return BannerAd(adUnitId: "ca-app-pub-8359837919145212/3798903267",size: AdSize.largeBanner,listener: (MobileAdEvent mobileAdEvent){
      bannerAd!..show();
    },);
  }
  @override
  void initState() {
    super.initState();
    bannerAd=showBannerAd()..load();
    generateRandomPalette();
  }

  List<ColorInfo> colorPalette = [];

  void generateRandomPalette() {
    setState(() {
      colorPalette = generateColorPalette(5);
    });
  }

  List<ColorInfo> generateColorPalette(int numColors) {
    List<ColorInfo> palette = [];

    for (int i = 0; i < numColors; i++) {
      palette.add(ColorInfo(generateRandomColor()));
    }

    return palette;
  }

  Color generateRandomColor() {
    final random = Random();
    final hue = random.nextDouble();
    final saturation = random.nextDouble() * 0.5 + 0.5;
    final brightness = random.nextDouble() * 0.4 + 0.6;
    return HSVColor.fromAHSV(1.0, hue * 360, saturation, brightness).toColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your Best Color '),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: colorPalette.length,
        itemBuilder: (context, index) {
          return ColorListItem(colorInfo: colorPalette[index]);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: generateRandomPalette,
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
