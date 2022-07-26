import 'dart:io';
import 'package:aventura_com_bako/features/mapa/presentation/page/mapa_screen.dart';
import 'package:aventura_com_bako/features/qrcode/presentation/pages/controller/qrcode_scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({Key? key, required this.mapa}) : super(key: key);

  final MapScreen mapa;

  @override
  State<QrCodeScannerPage> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  late Barcode barcode;
  QrCodeController controller = Get.put(QrCodeController());

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              QRView(
                key: qrKey,
                onQRViewCreated: onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.green.shade900,
                  borderRadius: 10,
                  borderLength: 20,
                  borderWidth: 10,
                  cutOutSize: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
              Center(
                heightFactor: 2,
                child: Positioned(
                  top: 20,
                  child: Container(
                    width: 150.00,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white54),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FutureBuilder<bool?>(
                            future: qrController?.getFlashStatus(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return Icon(
                                  snapshot.data!
                                      ? Icons.flash_on_rounded
                                      : Icons.flash_off_rounded,
                                  color: Colors.green[900],
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          onPressed: () async {
                            await qrController?.toggleFlash();
                            setState(() {});
                          },
                        ),
                        IconButton(
                          icon: FutureBuilder(
                            future: qrController?.getCameraInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return Icon(
                                  Icons.switch_camera_rounded,
                                  color: Colors.green[900],
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          onPressed: () async {
                            await qrController?.flipCamera();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                child: Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.white60,
                    ),
                    child: Text(
                      'Aponte a câmera do seu celular\n para o QrCode',
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                child: Container(
                  width: 130.00,
                  height: 130.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: ExactAssetImage('assets/bako_vetor.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   top: 40,
              //   child: Container(
              //     padding: EdgeInsets.all(12),
              //     child: Text(
              //       barcode != null
              //           ? 'Valor qrcode: ${barcode!.code}'
              //           : 'Sem valor',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      );

  void onQRViewCreated(QRViewController qrController) {
    setState(() => this.qrController = qrController);

    qrController.scannedDataStream.listen(
      (barcode) => setState(
        () {
          this.barcode = barcode;
          widget.mapa.especieLida = this.barcode.code!;
          widget.mapa.overlays.add('InformacoesEspeciesPage');
          widget.mapa.overlays.remove('QrCodePage');
          // widget.mapa.overlays.notifyListeners();
        },
      ),
    );
  }
}
