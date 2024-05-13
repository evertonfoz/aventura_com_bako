import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/radar_tree.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/background.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/devices_not_found.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/model/tree.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/controller/trees.dart';
import 'package:aventura_com_bako/features/splashscreen/presentation/pages/startScreen.dart';
import 'package:flutter/material.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/channels/ble_scanner_channel.dart';

class CacaArvoresPage extends StatefulWidget {
  CacaArvoresPage({super.key, required this.trees, this.tree});

  List<Tree> trees;
  final Tree? tree;

  @override
  State<CacaArvoresPage> createState() => _CacaArvoresPageState();
}

class _CacaArvoresPageState extends State<CacaArvoresPage> {
  final BleScannerChannel _channelDevices = BleScannerChannel();

  Tree treeChoice = Tree();

  @override
  Widget build(BuildContext context) {
    treeChoice = widget.tree ?? Trees().shuffle(widget.trees);

    _channelDevices.startScan();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Caça às Árvores'),
      ),
      body: Stack(
        children: [
          const Background(),
          if (treeChoice.macAddress == 'defaultMacAddress')
            Center(
              child: _finishedTreeChase(context),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder(
                  stream: _channelDevices.stream,
                  builder: (context, snapshop) {
                    return _buildTreeRadar(snapshop);
                  },
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget _finishedTreeChase(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        bakoMessage(
          "Olha, você pelo jeito caçou todas as árvores!\nParabéns, aproveite para jogar outros minijogos ou fazer o passeio pelo bosque!",
          context,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
      ],
    );
  }

  Widget bakoMessage(message, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: const ShapeDecoration(
            color: Colors.yellow,
            shape: TooltipShapeBorder(
              arrowArc: 0.5,
              arrowHeight: 35,
            ),
            shadows: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(2, 2),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Image(
          image: AssetImage('assets/Bako_1281x1423.png'),
          fit: BoxFit.fitWidth,
          height: 350,
        ),
      ],
    );
  }

  Widget _buildTreeRadar(AsyncSnapshot<dynamic> snapshop) {
    double distance = 0.0;
    if (snapshop.hasData) {
      List data = List.empty();

      for (int index = 0; index < snapshop.data!.length; index++) {
        if (snapshop.data![index][0] == treeChoice.macAddress) {
          data = snapshop.data![index];
        }
      }

      if (data.isNotEmpty && data[3] != '') {
        distance = double.parse(data[3].replaceAll(',', '.'));
      } else {
        distance = 0;
      }

      return RadarTree(
        tree: treeChoice,
        distance: distance,
        bleScanner: _channelDevices,
        trees: widget.trees,
      );
    }
    //se não tiver dados dos dispositivos bluetooth, informa que está procurando arvores ainda
    return const DevicesNotFound();
  }
}
