import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import './singletons/cashier_data.dart';
import 'cash_count.dart';

class GiftCertificateBPage extends StatefulWidget {
  const GiftCertificateBPage({super.key});

  @override
  State<GiftCertificateBPage> createState() => _GiftCertificateBPageState();
}

class _GiftCertificateBPageState extends State<GiftCertificateBPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('金券B（${DateFormat('yyyy-MM-dd').format(DateTime.now())}）'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text('【商品券現物の額面（合計金額）】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${giftCertificateBData.xyzAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'XYZ商品券（釣り銭あり）',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      giftCertificateBData.xyzAmount = 0;
                    } else {
                      giftCertificateBData.xyzAmount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${giftCertificateBData.xyzChangeAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '生じた釣り銭（XYZ商品券）',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      giftCertificateBData.xyzChangeAmount = 0;
                    } else {
                      giftCertificateBData.xyzChangeAmount = int.parse(value);
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
                  initialValue: '${giftCertificateBData.jafAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'JAFお食事券（釣り銭あり）',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      giftCertificateBData.jafAmount = 0;
                    } else {
                      giftCertificateBData.jafAmount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${giftCertificateBData.jafChangeAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '生じた釣り銭（JAFお食事券）',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      giftCertificateBData.jafChangeAmount = 0;
                    } else {
                      giftCertificateBData.jafChangeAmount = int.parse(value);
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
                  initialValue: '${giftCertificateBData.cloudTicketAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'クラウド珈琲チケット',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      giftCertificateBData.cloudTicketAmount = 0;
                    } else {
                      giftCertificateBData.cloudTicketAmount = int.parse(value);
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
                    if (posData.keyGiftCertificateBTotalAmount == 0) {
                      posData.keyGiftCertificateBTotalAmount =
                          giftCertificateBData
                                  .getGiftCertificateBTotalAmount(true) -
                              giftCertificateBData
                                  .getGiftCertificateBTotalChanges();
                      setState(() {});
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => super.widget));
                    }
                  },
                  child: Text(
                    '合計\n ${NumberFormat('¥ #,###').format(giftCertificateBData.getGiftCertificateBTotalAmount(true) - giftCertificateBData.getGiftCertificateBTotalChanges())}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const Divider(height: 0),
          const Text('【POS.取引キー集計.金券B】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${posData.keyGiftCertificateBTotalAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'POS.取引キー集計.金券B.金額',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      posData.keyGiftCertificateBTotalAmount = 0;
                    } else {
                      posData.keyGiftCertificateBTotalAmount = int.parse(value);
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
                  '現物との差異\n ${NumberFormat('¥ #,###').format(giftCertificateBData.getGiftCertificateBTotalAmount(true) - giftCertificateBData.getGiftCertificateBTotalChanges() - posData.keyGiftCertificateBTotalAmount)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const Divider(height: 0),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                '現金チェック',
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
