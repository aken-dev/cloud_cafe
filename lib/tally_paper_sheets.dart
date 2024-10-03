import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import './singletons/cashier_data.dart';
import 'cashless_page.dart';
import 'cash_count.dart';

class CustomerCountPage extends StatefulWidget {
  const CustomerCountPage({super.key});

  @override
  State<CustomerCountPage> createState() => _CustomerCountPageState();
}

class _CustomerCountPageState extends State<CustomerCountPage> {
  int forHereAmountTaxIncluded() {
    return posData.getTotalAmountTaxIncluded() -
        customerAmountData.takeOutTotalAmount -
        customerAmountData.deliveryOrderSlipsTotalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:
            Text('紙伝票 集計（${DateFormat('yyyy-MM-dd').format(DateTime.now())}）'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text('【紙伝票（実物）】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${customerAmountData.takeOutItemCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'テイクアウト商品個数',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      customerAmountData.takeOutItemCount = 0;
                    } else {
                      customerAmountData.takeOutItemCount = int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${customerAmountData.takeOutTotalAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'テイクアウト金額合計',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      customerAmountData.takeOutTotalAmount = 0;
                    } else {
                      customerAmountData.takeOutTotalAmount = int.parse(value);
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
                  initialValue: '${customerAmountData.forHereOrderCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '店内客数',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      customerAmountData.forHereOrderCount = 0;
                    } else {
                      customerAmountData.forHereOrderCount = int.parse(value);
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
                  '店内売上合計\n ${NumberFormat('¥ #,###').format(forHereAmountTaxIncluded())}',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const Divider(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${customerAmountData.deliveryOrderItemCount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'デリバリー商品個数',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      customerAmountData.deliveryOrderItemCount = 0;
                    } else {
                      customerAmountData.deliveryOrderItemCount =
                          int.parse(value);
                    }
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: GestureDetector(
                  onDoubleTap: () {
                    if (posData.keyDeliveryTotalAmount == 0) {
                      posData.keyDeliveryTotalAmount =
                          customerAmountData.deliveryOrderSlipsTotalAmount;
                      setState(() {});
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => super.widget));
                    }
                  },
                  child: TextFormField(
                    initialValue:
                        '${customerAmountData.deliveryOrderSlipsTotalAmount}',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'デリバリー金額合計',
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        customerAmountData.deliveryOrderSlipsTotalAmount = 0;
                      } else {
                        customerAmountData.deliveryOrderSlipsTotalAmount =
                            int.parse(value);
                      }
                      setState(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const Divider(height: 0),
          const Text('【POS.取引キー集計.デリバリー】'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  initialValue: '${posData.keyDeliveryTotalAmount}',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'POS.取引キー集計.デリバリー.金額',
                  ),
                  onChanged: (value) {
                    if (value == '') {
                      posData.keyDeliveryTotalAmount = 0;
                    } else {
                      posData.keyDeliveryTotalAmount = int.parse(value);
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
                  '紙伝票との差異\n ${NumberFormat('¥ #,###').format(customerAmountData.deliveryOrderSlipsTotalAmount - posData.keyDeliveryTotalAmount)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
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
                            builder: (context) => const CashlessPage()))
                    .then((value) {
                  setState(() {});
                });
              },
              child: const Text(
                'キャッシュレス',
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
