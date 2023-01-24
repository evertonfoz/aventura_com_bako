import 'package:aventura_com_bako/features/mapa/presentation/page/mapa_screen.dart';
import 'package:aventura_com_bako/features/qrcode/presentation/pages/controller/qrcode_scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../informacoes_especies/presentation/controller/informacoes_controller.dart';
import '../../../informacoes_especies/presentation/widgets/carregando_pagina_widget.dart';

class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({
    Key? key,
    required this.mapa,
  }) : super(key: key);

  final MapScreen mapa;

  @override
  State<QrCodeScannerPage> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  QrCodeController controller = Get.put(QrCodeController());

  MobileScannerController cameraController = MobileScannerController();

  InformacoesEspeciesController informacoesEspeciesController =
      Get.put(InformacoesEspeciesController());

  void _removerQRCodePage() {
    widget.mapa.mostrarQrCodePage = false;
    widget.mapa.overlays.remove('QrCodePage');
    widget.mapa.mostrarQrCodePage = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (informacoesEspeciesController.buscandoEspecieLida.value) {
          return const CarregandoPaginaWidget();
        }

        return Stack(
          children: <Widget>[
            MobileScanner(
              allowDuplicates: false,
              controller: cameraController,
              onDetect: (barcode, args) async {
                final String code = barcode.rawValue ?? "---";

                informacoesEspeciesController.valorQrCode.value = code;

                await informacoesEspeciesController.getInformacaoEspecieLida();

                navegarProximaPagina();
              },
            ),
            IconButton(
              icon: const Icon(Icons.close),
              iconSize: 32.0,
              onPressed: () => _removerQRCodePage(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 50,
                width: 150,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      color: Colors.white,
                      icon: ValueListenableBuilder(
                        valueListenable: cameraController.torchState,
                        builder: (context, state, child) {
                          switch (state as TorchState) {
                            case TorchState.off:
                              return const Icon(Icons.flash_off_rounded,
                                  color: Colors.grey);
                            case TorchState.on:
                              return const Icon(Icons.flash_on_rounded,
                                  color: Colors.green);
                          }
                        },
                      ),
                      onPressed: () => cameraController.toggleTorch(),
                    ),
                    IconButton(
                      color: Colors.green,
                      icon: ValueListenableBuilder(
                        valueListenable: cameraController.cameraFacingState,
                        builder: (context, state, child) {
                          switch (state as CameraFacing) {
                            case CameraFacing.front:
                              return const Icon(Icons.camera_front);
                            case CameraFacing.back:
                              return const Icon(Icons.camera_rear);
                          }
                        },
                      ),
                      iconSize: 32.0,
                      onPressed: () => cameraController.switchCamera(),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 130.00,
                      height: 130.00,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/bako_vetor.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
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
                            overflow: TextOverflow.clip),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void navegarProximaPagina() {
    if (informacoesEspeciesController
            .especieLida.value.informacoesEspeciesEnum ==
        widget.mapa.pontoCapturado) {
      if (informacoesEspeciesController
              .especieLida.value.especieRepetidaNaTrilha &&
          (informacoesEspeciesController.especieLida.value.numDescobertas ??
                  0) <
              2) {
        widget.mapa.overlays.add('InformacoesEspeciesPage');
      } else if (informacoesEspeciesController
              .especieLida.value.especieDescoberta ==
          false) {
        widget.mapa.overlays.add('InformacoesEspeciesPage');
      } else {
        widget.mapa.overlays.add('EspecieRepetidaPage');
      }
    } else {
      widget.mapa.overlays.add('EspecieErradaPage');
    }
    _removerQRCodePage();
  }
}
