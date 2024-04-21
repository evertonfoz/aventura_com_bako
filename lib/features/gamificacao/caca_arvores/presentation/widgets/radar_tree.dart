import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/pages/result_caca_page.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/model/tree.dart';
import 'package:flutter/material.dart';

class RadarTree extends StatelessWidget {
  const RadarTree({
    super.key,
    required this.tree,
    required this.distance,
  });

  final Tree tree;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0),
          infoTree(),
          const SizedBox(height: 30.0),
          radarBuild(),
          const SizedBox(height: 30.0),
          footerComplement(context),
        ],
      ),
    );
  }

  Widget radarBuild() {
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
      height: 200,
      width: 200,
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
                image: AssetImage(radarSignalImage), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  Widget infoTree() {
    return SizedBox(
      width: 400,
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(children: [
            Text(
              tree.popularName,
              style: const TextStyle(fontSize: 32.0, color: Colors.white),
            ),
            Text(
              tree.scienceName,
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 26.0,
                  color: Colors.white),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: Image(
                image: tree.image!.image,
                fit: BoxFit.contain,
                height: 200,
              ),
            ),
            Text(
              "$distance metros distante",
              style: const TextStyle(fontSize: 26.0, color: Colors.white),
            ),
            const SizedBox(height: 10.0),
          ]),
        ),
      ),
    );
  }

  Widget footerComplement(context) {
    if (distance < 1) {
      return qrCode(context);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          width: 400,
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
                    return Text(
                      tree.tips[index],
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget qrCode(context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultCacaPage(
              tree: tree,
              isCorrect: true,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 150,
        width: 150,
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
              image: const DecorationImage(
                  image: AssetImage('assets/icons/qr_code2.png'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
