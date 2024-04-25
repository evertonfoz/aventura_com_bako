import 'package:aventura_com_bako/features/gamificacao/caca_arvores/channels/ble_scanner_channel.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/pages/result_caca_page.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/model/tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCode extends StatelessWidget {
  const QRCode({
    super.key,
    required this.tree,
    required this.bleScanner,
  });

  final Tree tree;
  final BleScannerChannel bleScanner;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {scanQRCode(context)}, //scanQRCode(context),
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

  scanQRCode(context) async {
    bool isCorrect = false;
    String code = "";
    try {
      code = await FlutterBarcodeScanner.scanBarcode(
        '#00ff00',
        'Voltar',
        true,
        ScanMode.QR,
      );
    } finally {
      isCorrect = code == tree.popularName;
      bleScanner.stopScan();
      if (isCorrect) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultCacaPage(
              tree: tree,
              isCorrect: isCorrect,
              bleScanner: bleScanner,
            ),
          ),
        );
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultCacaPage(
            tree: tree,
            isCorrect: isCorrect,
            bleScanner: bleScanner,
          ),
        ),
      );
    }
  }
}
