import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import './singletons/cashier_data.dart';
import 'cash_count.dart';
import 'gift_certificateA.dart';

class ApplePayAndPointPage extends StatefulWidget {
  const ApplePayAndPointPage({super.key});

  @override
  State<ApplePayAndPointPage> createState() => _ApplePayAndPointPageState();
}

class _ApplePayAndPointPageState extends State<ApplePayAndPointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
            'アップルペイ＆ポイント\n（${DateFormat('yyyy-MM-dd').format(DateTime.now())}）'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text('【CAT.iD.売上 ＋ CAT.QuickPay.売上】'),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    initialValue: '${catData.iDTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CAT.iD.売上',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        catData.iDTotalAmount = 0;
                      } else {
                        catData.iDTotalAmount = int.parse(value);
                      }
                      setState(() {});
                    },
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    initialValue: '${catData.quickPayTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CAT.QuickPay.売上',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        catData.quickPayTotalAmount = 0;
                      } else {
                        catData.quickPayTotalAmount = int.parse(value);
                      }
                      setState(() {});
                    },
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onDoubleTap: () {
                      if (posData.keyApplePayTotalAmount == 0) {
                        posData.keyApplePayTotalAmount =
                            catData.iDTotalAmount + catData.quickPayTotalAmount;
                        setState(() {});
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => super.widget));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Text(
                        '合計\n (A)${NumberFormat('¥ #,###').format(catData.iDTotalAmount + catData.quickPayTotalAmount)}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
          const Text('【POS.取引キー集計.アップルペイ】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${posData.keyApplePayTotalAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '(B) POS.取引キー集計.アップルペイ.金額',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      posData.keyApplePayTotalAmount = 0;
                    } else {
                      posData.keyApplePayTotalAmount = int.parse(value);
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
                  '差異(A - B)\n ${NumberFormat('¥ #,###').format(catData.iDTotalAmount + catData.quickPayTotalAmount - posData.keyApplePayTotalAmount)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const Divider(height: 0),
          const Text('【CAT.ポイント支払い ー POS.取引キー集計.ポイント】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 10),
              Flexible(
                child: GestureDetector(
                  onDoubleTap: () {
                    if (posData.keyPointTotalAmount == 0) {
                      posData.keyPointTotalAmount = catData.pointTotalAmount;
                      setState(() {});
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => super.widget));
                    }
                  },
                  child: TextFormField(
                    initialValue: '${catData.pointTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CAT.ポイント支払い.合計',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        catData.pointTotalAmount = 0;
                      } else {
                        catData.pointTotalAmount = int.parse(value);
                      }
                      setState(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${posData.keyPointTotalAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'POS.取引キー集計.ポイント.金額',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      posData.keyPointTotalAmount = 0;
                    } else {
                      posData.keyPointTotalAmount = int.parse(value);
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
                  '差異\n ${NumberFormat('#,###').format(catData.pointTotalAmount - posData.keyPointTotalAmount)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const Divider(height: 0),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                            builder: (context) => const GiftCertificateAPage()))
                    .then((value) {
                  setState(() {});
                });
              },
              child: const Text(
                '金券A',
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
