import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/radar_tree.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/background.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/devices_not_found.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/model/tree.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/controller/trees.dart';
import 'package:flutter/material.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/channels/ble_scanner_channel.dart';

class CacaArvoresPage extends StatefulWidget {
  const CacaArvoresPage({super.key, user});

  @override
  State<CacaArvoresPage> createState() => _CacaArvoresPageState();
}

class _CacaArvoresPageState extends State<CacaArvoresPage> {
  final BleScannerChannel _channelDevices = BleScannerChannel();
  Tree treeChoice = Tree();

  @override
  Widget build(BuildContext context) {
    treeChoice = Trees().shuffle();
    _channelDevices.startScan();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caça às Árvores'),
      ),
      body: Stack(
        children: [
          const Background(),
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

  Widget _buildTreeRadar(AsyncSnapshot<dynamic> snapshop) {
    double distance = 0.0;
    if (snapshop.hasData) {
      List data = List.empty();

      for (int index = 0; index < snapshop.data!.length; index++) {
        if (snapshop.data![index][0] == treeChoice.macAddress) {
          data = snapshop.data![index];
        }
      }

      if (data.isNotEmpty) {
        distance = double.parse(data[3].replaceAll(',', '.'));
      }
      return RadarTree(
          tree: treeChoice, distance: distance, bleScanner: _channelDevices);
    }
    //_channelDevices.startScan();
    //se não tiver dados dos dispositivos bluetooth, informa que está procurando arvores ainda
    return const DevicesNotFound();
  }
}
