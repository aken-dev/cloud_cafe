import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import './singletons/cashier_data.dart';
import 'deposit.dart';

class CashCountBkPage extends StatefulWidget {
  const CashCountBkPage({super.key});

  @override
  State<CashCountBkPage> createState() => _CashCountBkPageState();
}

class _CashCountBkPageState extends State<CashCountBkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:
            Text('現金チェック（${DateFormat('yyyy-MM-dd').format(DateTime.now())}）'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text('【紙幣（枚）】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.thousandBillCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '千円',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.thousandBillCount = 0;
                    } else {
                      cashData.thousandBillCount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.twoThousandBillCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '2千円',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.twoThousandBillCount = 0;
                    } else {
                      cashData.twoThousandBillCount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.fiveThousandBillCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '5千円',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.fiveThousandBillCount = 0;
                    } else {
                      cashData.fiveThousandBillCount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.tenThousandBillCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '1万円',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.tenThousandBillCount = 0;
                    } else {
                      cashData.tenThousandBillCount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
          const Divider(height: 0),
          const Text('【棒金（本）】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.oneCoinStickCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[1]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.oneCoinStickCount = 0;
                    } else {
                      cashData.oneCoinStickCount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.fiveCoinStickCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[5]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.fiveCoinStickCount = 0;
                    } else {
                      cashData.fiveCoinStickCount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.tenCoinStickCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[10]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.tenCoinStickCount = 0;
                    } else {
                      cashData.tenCoinStickCount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.fiftyCoinStickCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[50]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.fiftyCoinStickCount = 0;
                    } else {
                      cashData.fiftyCoinStickCount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.hundredCoinStickCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[100]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.hundredCoinStickCount = 0;
                    } else {
                      cashData.hundredCoinStickCount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.fiveHundredCoinStickCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[500]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.fiveHundredCoinStickCount = 0;
                    } else {
                      cashData.fiveHundredCoinStickCount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
          const Divider(height: 0),
          const Text('【バラ硬貨（金額）】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //const SizedBox(width: 6),
              SizedBox(
                width: 45,
                child: TextFormField(
                  initialValue: '${cashData.oneCoinCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[1]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.oneCoinCount = 0;
                    } else {
                      cashData.oneCoinCount = (int.parse(value) ~/ 1);
                    }
                    setState(() {});
                  },
                ),
              ),
              //const SizedBox(width: 6),
              SizedBox(
                width: 55,
                child: TextFormField(
                  initialValue: '${cashData.fiveCoinCount * 5}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[5]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.fiveCoinCount = 0;
                    } else {
                      cashData.fiveCoinCount = (int.parse(value) ~/ 5);
                    }
                    setState(() {});
                  },
                ),
              ),
              //const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.tenCoinCount * 10}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[10]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.tenCoinCount = 0;
                    } else {
                      cashData.tenCoinCount = (int.parse(value) ~/ 10);
                    }
                    setState(() {});
                  },
                ),
              ),
              //const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.fiftyCoinCount * 50}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[50]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.fiftyCoinCount = 0;
                    } else {
                      cashData.fiftyCoinCount = (int.parse(value) ~/ 50);
                    }
                    setState(() {});
                  },
                ),
              ),
              //const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${cashData.hundredCoinCount * 100}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[100]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.hundredCoinCount = 0;
                    } else {
                      cashData.hundredCoinCount = (int.parse(value) ~/ 100);
                    }
                    setState(() {});
                  },
                ),
              ),
              //const SizedBox(width: 6),
              SizedBox(
                width: 75,
                child: TextFormField(
                  initialValue: '${cashData.fiveHundredCoinCount * 500}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '[500]',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      cashData.fiveHundredCoinCount = 0;
                    } else {
                      cashData.fiveHundredCoinCount = (int.parse(value) ~/ 500);
                    }
                    setState(() {});
                  },
                ),
              ),
              //const SizedBox(width: 6),
            ],
          ),
          const Divider(height: 0),
          const Text('【現金】ー【POS.取引キー集計.現金】＋【金券釣り銭】\n ＝【翌日釣銭準備金】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '現金\n${NumberFormat('¥ #,###').format(cashData.getCashTotalAmount())}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: TextFormField(
                  initialValue: '${posData.keyGenkinTotalAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'POS.取引キー集計.現金',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      posData.keyGenkinTotalAmount = 0;
                    } else {
                      posData.keyGenkinTotalAmount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  '金券釣り銭\n${NumberFormat('¥ #,###').format(giftCertificateBData.getGiftCertificateBTotalChanges())}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '翌日準備金\n${NumberFormat('¥ #,###').format(cashData.getCashTotalAmount() - posData.getGenkinAridakaAmount())}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '標準額[${NumberFormat('¥#,###').format((posData.standardAmountForCashReserve))}]\nとの差異：${NumberFormat('¥ #,###').format(cashData.getCashTotalAmount() - posData.getGenkinAridakaAmount() - posData.standardAmountForCashReserve)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DepositPage()))
                          .then((value) {
                        setState(() {});
                      });
                    },
                    child: const Text(
                      '入金',
                      style: TextStyle(
                        fontSize: 16,
                        height: 0.5,
                      ),
                    ),
                  )),
                ]),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
