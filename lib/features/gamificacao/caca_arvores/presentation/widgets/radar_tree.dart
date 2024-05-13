import 'package:aventura_com_bako/features/gamificacao/caca_arvores/channels/ble_scanner_channel.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/qrcode.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/quente_frio.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/model/tree.dart';
import 'package:flutter/material.dart';

class RadarTree extends StatelessWidget {
  const RadarTree({
    super.key,
    required this.tree,
    required this.distance,
    required this.bleScanner,
    required this.trees,
  });

  final Tree tree;
  final double distance;
  final BleScannerChannel bleScanner;
  final List<Tree> trees;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0),
          infoTree(),
          const SizedBox(height: 20.0),
          tips(context),
          const SizedBox(height: 20.0),
          footerComplement(context),
        ],
      ),
    );
  }

  Widget radarBuild(context) {
    String radarSignalImage;
    if (distance < 3) {
      radarSignalImage = 'assets/games/caca_arvores/near_plus.png';
    } else if (distance < 5) {
      radarSignalImage = 'assets/games/caca_arvores/near.png';
    } else if (distance < 10) {
      radarSignalImage = 'assets/games/caca_arvores/far.png';
    } else {
      radarSignalImage = 'assets/games/caca_arvores/far_plus.png';
    }

    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.35,
      width: MediaQuery.of(context).size.width * 0.35,
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(radarSignalImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget infoTree() {
    return SizedBox(
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: Image(
                  image: tree.image!.image,
                  fit: BoxFit.contain,
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget footerComplement(context) {
    //return QuenteFrio(distance: distance);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (distance < 1)
          QRCode(
            tree: tree,
            bleScanner: bleScanner,
            trees: trees,
          )
        else
          radarBuild(context),
        QuenteFrio(distance: distance),
      ],
    );
  }

  Widget tips(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white60,
          ),
          child: Column(
            children: [
              const Text('Dica:'),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8),
                  itemCount: tree.tips.length,
                  itemBuilder: (context, index) {
                    return Text(tree.tips[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
