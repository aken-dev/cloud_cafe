import 'dart:async';
import 'package:flutter/material.dart';
import 'singletons/cashier_data.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRReadingPage extends StatefulWidget {
  const QRReadingPage({super.key});

  @override
  State<QRReadingPage> createState() => _QRReadingPageState();
}

class _QRReadingPageState extends State<QRReadingPage> {
  final MobileScannerController controller = MobileScannerController(
    torchEnabled: false,
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  Widget _buildBarcodesListView() {
    return StreamBuilder<BarcodeCapture>(
      stream: controller.barcodes,
      builder: (context, snapshot) {
        final barcodes = snapshot.data?.barcodes;
        if (barcodes == null || barcodes.isEmpty) {
          return const Center(
            child: Text(
              '入金票のQRを読み込んでください!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        } else {
          for (final barcode in barcodes) {
            debugPrint(barcode.rawValue);
            if (barcode.rawValue == null ||
                DateTime.now()
                        .difference(depositedCashData.lastDepositDateTime)
                        .inSeconds <=
                    1) break;
            String resultText = barcode.rawValue as String;
            List<String> splitTexts = resultText.split('\n');
            for (final splitText in splitTexts) {
              if (splitText.contains('入金売上金計')) {
                String tmpText = splitText.replaceAll("入金売上金計", "");
                tmpText = tmpText.replaceAll(" ", "");
                tmpText = tmpText.replaceAll("　", "");
                tmpText = tmpText.replaceAll(",", "");
                tmpText = tmpText.replaceAll("\t", "");
                depositedCashData.depositedCashAmount += int.parse(tmpText);
              }
              if (splitText.contains('入金金券計')) {
                String tmpText = splitText.replaceAll("入金金券計", "");
                tmpText = tmpText.replaceAll(" ", "");
                tmpText = tmpText.replaceAll("　", "");
                tmpText = tmpText.replaceAll(",", "");
                tmpText = tmpText.replaceAll("\t", "");
                depositedCashData.depositedGiftCertificatesAmount +=
                    int.parse(tmpText);
                depositedCashData.depositTimes += 1;
                depositedCashData.lastDepositDateTime = DateTime.now();
                goBackToDepositPage();
                break;
              }
            }
          }
        }
        return ListView.builder(
          itemCount: barcodes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                barcodes[index].rawValue ?? '入金票のQRを読み込んでください',
                overflow: TextOverflow.visible,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:
            Text('QR読み込み（${DateFormat('yyyy-MM-dd').format(DateTime.now())}）'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            fit: BoxFit.contain,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.4),
              child: Column(
                children: [
                  Expanded(
                    child: _buildBarcodesListView(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller.dispose();
  }

  Future<void> goBackToDepositPage() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await controller.dispose();
    Navigator.of(context).pop();
  }
}
