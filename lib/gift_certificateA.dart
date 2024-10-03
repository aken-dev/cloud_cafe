import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import './singletons/cashier_data.dart';
import 'cash_count.dart';
import 'gift_certificateB.dart';

class GiftCertificateAPage extends StatefulWidget {
  const GiftCertificateAPage({super.key});

  @override
  State<GiftCertificateAPage> createState() => _GiftCertificateAPageState();
}

class _GiftCertificateAPageState extends State<GiftCertificateAPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('金券A（${DateFormat('yyyy-MM-dd').format(DateTime.now())}）'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text('【ギフトカード現物の額面（合計金額）】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${giftCertificateAData.jtcAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'JTCギフトカード',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      giftCertificateAData.jtcAmount = 0;
                    } else {
                      giftCertificateAData.jtcAmount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${giftCertificateAData.acAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ACギフトカード',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      giftCertificateAData.acAmount = 0;
                    } else {
                      giftCertificateAData.acAmount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${giftCertificateAData.tacosAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'tacosギフトカード',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      giftCertificateAData.tacosAmount = 0;
                    } else {
                      giftCertificateAData.tacosAmount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${giftCertificateAData.localGiftCardAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '地域ギフトカード ',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      giftCertificateAData.localGiftCardAmount = 0;
                    } else {
                      giftCertificateAData.localGiftCardAmount =
                          int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all()),
                child: GestureDetector(
                  onDoubleTap: () {
                    if (posData.keyGiftCertificateATotalAmount == 0) {
                      posData.keyGiftCertificateATotalAmount =
                          giftCertificateAData.getGiftCertificateATotalAmount();
                      setState(() {});
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => super.widget));
                    }
                  },
                  child: Text(
                    '合計\n ${NumberFormat('¥ #,###').format(giftCertificateAData.getGiftCertificateATotalAmount())}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const Divider(height: 0),
          const Text('【POS.取引キー集計.金券A】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${posData.keyGiftCertificateATotalAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'POS.取引キー集計.金券A.金額',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      posData.keyGiftCertificateATotalAmount = 0;
                    } else {
                      posData.keyGiftCertificateATotalAmount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '現物との差異\n ${NumberFormat('¥ #,###').format(giftCertificateAData.getGiftCertificateATotalAmount() - posData.keyGiftCertificateATotalAmount)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const Divider(height: 0),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
                child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CashCountPage()))
                    .then((value) {
                  setState(() {});
                });
              },
              child: const Text(
                '現金チェック直行',
                style: TextStyle(
                  fontSize: 16,
                  height: 0.5,
                ),
              ),
            )),
            SizedBox(
                child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GiftCertificateBPage()))
                    .then((value) {
                  setState(() {});
                });
              },
              child: const Text(
                '金券B',
                style: TextStyle(
                  fontSize: 16,
                  height: 0.5,
                ),
              ),
            )),
          ]),
        ],
      ),
    );
  }
}
