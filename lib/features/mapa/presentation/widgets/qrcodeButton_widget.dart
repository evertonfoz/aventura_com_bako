import 'package:flutter/material.dart';

import '../page/mapa_screen.dart';

class QrcodeButton extends StatefulWidget {
  const QrcodeButton({super.key, required this.mapa});
  final MapScreen mapa;
  @override
  State<QrcodeButton> createState() => _QrcodeButtonState();
}

class _QrcodeButtonState extends State<QrcodeButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.green),
        child: IconButton(
          icon: Image.asset('assets/icons/qr_code2.png', fit: BoxFit.fitHeight),
          iconSize: 50,
          onPressed: () {
            widget.mapa.overlays.add('QrCodePage');
          },
        ),
      ),
    );
  }
}
