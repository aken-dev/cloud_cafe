import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import './singletons/cashier_data.dart';
import 'applepay_point.dart';
import 'cash_count.dart';

class CashlessPage extends StatefulWidget {
  const CashlessPage({super.key});

  @override
  State<CashlessPage> createState() => _CashlessPageState();
}

class _CashlessPageState extends State<CashlessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:
            Text('キャッシュレス（${DateFormat('yyyy-MM-dd').format(DateTime.now())}）'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text('【CashlessTerminal】＆【CAT.クレジット】'),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    initialValue: '${cashlessTerminalData.nanacoTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'nanaco.支払',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        cashlessTerminalData.nanacoTotalAmount = 0;
                      } else {
                        cashlessTerminalData.nanacoTotalAmount =
                            int.parse(value);
                      }
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    initialValue: '${cashlessTerminalData.waonTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'WAON.合計',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        cashlessTerminalData.waonTotalAmount = 0;
                      } else {
                        cashlessTerminalData.waonTotalAmount = int.parse(value);
                      }
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    initialValue: '${cashlessTerminalData.suicaTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '交通系IC.合計',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        cashlessTerminalData.suicaTotalAmount = 0;
                      } else {
                        cashlessTerminalData.suicaTotalAmount =
                            int.parse(value);
                      }
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    initialValue:
                        '${cashlessTerminalData.rakutenEdyTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '楽天Edy.支払',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        cashlessTerminalData.rakutenEdyTotalAmount = 0;
                      } else {
                        cashlessTerminalData.rakutenEdyTotalAmount =
                            int.parse(value);
                      }
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    initialValue: '${cashlessTerminalData.localPayTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'LocalPay.合計',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        cashlessTerminalData.localPayTotalAmount = 0;
                      } else {
                        cashlessTerminalData.localPayTotalAmount =
                            int.parse(value);
                      }
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    initialValue: '${cashlessTerminalData.qrPayTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'QRコード決済.合計',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        cashlessTerminalData.qrPayTotalAmount = 0;
                      } else {
                        cashlessTerminalData.qrPayTotalAmount =
                            int.parse(value);
                      }
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    initialValue: '${catData.creditTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CAT.クレジット.売上合計',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        catData.creditTotalAmount = 0;
                      } else {
                        catData.creditTotalAmount = int.parse(value);
                      }
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onDoubleTap: () {
                    if (posData.keyCashlessTotalAmount == 0) {
                      posData.keyCashlessTotalAmount =
                          catData.creditTotalAmount +
                              cashlessTerminalData.getCTTotalAmount();
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
                      '合計\n (A) ${NumberFormat('¥ #,###').format(cashlessTerminalData.getCTTotalAmount() + catData.creditTotalAmount)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 15),
            const Text('【POS.取引キー集計.キャッシュレス】'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    initialValue: '${posData.keyCashlessTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '(B) POS.取引キー集計.キャッシュレス.金額',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        posData.keyCashlessTotalAmount = 0;
                      } else {
                        posData.keyCashlessTotalAmount = int.parse(value);
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
                    '差異(A - B)\n ${NumberFormat('¥ #,###').format(cashlessTerminalData.getCTTotalAmount() + catData.creditTotalAmount - posData.keyCashlessTotalAmount)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const Divider(height: 25),
            const Text('【CAT.クレジット.サイン要伝票枚数】＆【実際の枚数】'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(width: 10),
                Flexible(
                  child: GestureDetector(
                    onDoubleTap: () {
                      if (receiptData.creditReceiptWithSignatureCount == 0) {
                        receiptData.creditReceiptWithSignatureCount =
                            catData.creditReceiptWithSignatureCount;
                        setState(() {});
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => super.widget));
                      }
                    },
                    child: TextFormField(
                      initialValue:
                          '${catData.creditReceiptWithSignatureCount}',
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CAT.サイン要伝票枚数',
                      ),
                      onChanged: (value) {
                        if (value == '') {
                          catData.creditReceiptWithSignatureCount = 0;
                        } else {
                          catData.creditReceiptWithSignatureCount =
                              int.parse(value);
                        }
                        setState(() {});
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    initialValue:
                        '${receiptData.creditReceiptWithSignatureCount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '実在のサイン済伝票枚数',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        receiptData.creditReceiptWithSignatureCount = 0;
                      } else {
                        receiptData.creditReceiptWithSignatureCount =
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
                  child: Text(
                    '差異\n ${NumberFormat('#,###').format(receiptData.creditReceiptWithSignatureCount - catData.creditReceiptWithSignatureCount)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const Divider(height: 25),
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
                    fontSize: 11,
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
                          builder: (context) =>
                              const ApplePayAndPointPage())).then((value) {
                    setState(() {});
                  });
                },
                child: const Text(
                  "アップルペイ\n＆ ポイント払い",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.1,
                  ),
                ),
              )),
            ]),
          ],
        ),
      ),
    );
  }
}
