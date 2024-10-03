import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './singletons/cashier_data.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  int forHereAmountTaxIncluded() {
    return posData.getTotalAmountTaxIncluded() -
        customerAmountData.takeOutTotalAmount -
        customerAmountData.deliveryOrderSlipsTotalAmount;
  }

  int tenPercentTax(int amountTaxIncluded) {
    return amountTaxIncluded - (amountTaxIncluded / 1.1).round();
  }

  int eightPercentTax(int amountTaxIncluded) {
    return amountTaxIncluded - (amountTaxIncluded / 1.08).round();
  }

  int totalSalesPerCustomer() {
    if (customerAmountData.getCustomerOrderTotalCount() == 0) return 0;
    return (posData.getTotalAmountTaxIncluded() /
            customerAmountData.getCustomerOrderTotalCount())
        .round();
  }

  int forHereSalesPerCustomer() {
    if (customerAmountData.forHereOrderCount == 0) return 0;
    return (forHereAmountTaxIncluded() / customerAmountData.forHereOrderCount)
        .round();
  }

  int takeOutSalesPerCustomer() {
    if (customerAmountData.takeOutItemCount == 0) return 0;
    return (customerAmountData.takeOutTotalAmount /
            customerAmountData.takeOutItemCount)
        .round();
  }

  int deliverySalesPerCustomer() {
    if (customerAmountData.deliveryOrderItemCount == 0) return 0;
    return (customerAmountData.deliveryOrderSlipsTotalAmount /
            customerAmountData.deliveryOrderItemCount)
        .round();
  }

  String? diffApplePayKeyAmountTxt() {
    int posNum = posData.keyApplePayTotalAmount;
    int terminalNum = catData.iDTotalAmount + catData.quickPayTotalAmount;
    if (terminalNum - posNum == 0) return null;
    return '（差異 ${NumberFormat('¥ #,###').format(terminalNum - posNum)}）';
  }

  String? diffPointKeyAmountTxt() {
    int posNum = posData.keyPointTotalAmount;
    int terminalNum = catData.pointTotalAmount;
    if (terminalNum - posNum == 0) return null;
    return '（差異 ${NumberFormat('¥ #,###').format(terminalNum - posNum)}）';
  }

  String? diffKeyCashlessAmountTxt() {
    int posNum = posData.keyCashlessTotalAmount;
    int terminalNum =
        cashlessTerminalData.getCTTotalAmount() + catData.creditTotalAmount;
    if (terminalNum - posNum == 0) return null;
    return '（差異 ${NumberFormat('¥ #,###').format(terminalNum - posNum)}）';
  }

  String? diffKeyGiftCertificatesAmountTxt() {
    int posNum = posData.keyGiftCertificateATotalAmount +
        posData.keyGiftCertificateBTotalAmount;
    int tickets = giftCertificateAData.getGiftCertificateATotalAmount() +
        giftCertificateBData.getGiftCertificateBTotalAmount(true) -
        giftCertificateBData.getGiftCertificateBTotalChanges();
    if (tickets - posNum == 0) return null;
    return '（差異 ${NumberFormat('¥ #,###').format(tickets - posNum)}）';
  }

  String? diffKeyDeliveryAmountTxt() {
    int posNum = posData.keyDeliveryTotalAmount;
    int orderSlips = customerAmountData.deliveryOrderSlipsTotalAmount;
    if (orderSlips - posNum == 0) return null;
    return '（差異 ${NumberFormat('¥ #,###').format(orderSlips - posNum)}）';
  }

  String? diffCreditReceiptWithSignatureCountTxt() {
    int catNum = catData.creditReceiptWithSignatureCount;
    int receiptNum = receiptData.creditReceiptWithSignatureCount;
    if (receiptNum - catNum == 0) return null;
    return '（差異 ${NumberFormat(' #,###').format(receiptNum - catNum)}）';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:
            Text('入金レポート（${DateFormat('yyyy-MM-dd').format(DateTime.now())}）'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('【入金機での作業】'),
            const SizedBox(width: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '入金すべき現金\n${NumberFormat('¥ #,###').format(posData.keyGenkinTotalAmount - (giftCertificateBData.xyzChangeAmount + giftCertificateBData.jafChangeAmount))}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '入金した現金\n${NumberFormat('¥ #,###').format(depositedCashData.depositedCashAmount)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '差異\n${NumberFormat('¥ #,###').format(depositedCashData.depositedCashAmount - (posData.keyGenkinTotalAmount - (giftCertificateBData.xyzChangeAmount + giftCertificateBData.jafChangeAmount)))}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '入金すべき金券\n${NumberFormat('¥ #,###').format(giftCertificateAData.getGiftCertificateATotalAmount() + giftCertificateBData.getGiftCertificateBTotalAmount(false))}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '入金した金券\n${NumberFormat('¥ #,###').format(depositedCashData.depositedGiftCertificatesAmount)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '差異\n${NumberFormat('¥ #,###').format(depositedCashData.depositedGiftCertificatesAmount - giftCertificateAData.getGiftCertificateATotalAmount() - giftCertificateBData.getGiftCertificateBTotalAmount(false))}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text('※クラウド珈琲チケットは入金機の投入対象外'),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      '入金回数${NumberFormat('： #').format(depositedCashData.depositTimes)}',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                      width: 120.0,
                      // height: 70.0,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            depositedCashData.depositedCashAmount = 0;
                            depositedCashData.depositedGiftCertificatesAmount =
                                0;
                            depositedCashData.depositTimes = 0;
                          });
                        },
                        child: const Text(
                          '入金リセット',
                          style: TextStyle(
                            fontSize: 11,
                            height: 1,
                          ),
                        ),
                      )),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const Divider(height: 20),
            Text('【クラウド珈琲チケット提出ボックス】\n\t\t[ '
                '${NumberFormat('#,###').format(giftCertificateBData.cloudTicketAmount)} ]円分のチケットを専用封筒に入れて提出'),
            const Divider(height: 20),
            Text('【営業レポート記入事項】\n'
                '[客数]\t\t\t\t${NumberFormat('#,###').format(customerAmountData.getCustomerOrderTotalCount())}\t\t\t\t（'
                '店内 ${NumberFormat('#,### ').format(customerAmountData.forHereOrderCount)}'
                '  テイク ${NumberFormat('#,### ').format(customerAmountData.takeOutItemCount)}'
                '  デリ ${NumberFormat('#,### ').format(customerAmountData.deliveryOrderItemCount)}'
                '）\n'
                '[客単価]\t\t\t\t${NumberFormat('#,###').format(totalSalesPerCustomer())}\t\t\t\t（'
                '店内 ${NumberFormat('#,### ').format(forHereSalesPerCustomer())}'
                '  テイク ${NumberFormat('#,### ').format(takeOutSalesPerCustomer())}'
                '  デリ ${NumberFormat('#,### ').format(deliverySalesPerCustomer())}'
                '）\n'
                '[10%課税対象売上（税抜）]\t\t\t\t${NumberFormat('¥ #,###').format((forHereAmountTaxIncluded() - tenPercentTax(forHereAmountTaxIncluded())))}\t\t\t\t[税額]\t\t\t${NumberFormat('¥ #,###').format(tenPercentTax(forHereAmountTaxIncluded()))}\n'
                '[8%課税対象売上（税抜）]\t\t\t\t\t\t${NumberFormat('¥ #,###').format(customerAmountData.takeOutTotalAmount - eightPercentTax(customerAmountData.takeOutTotalAmount) + customerAmountData.deliveryOrderSlipsTotalAmount - eightPercentTax(customerAmountData.deliveryOrderSlipsTotalAmount))}\t\t\t\t\t[税額]\t\t\t${NumberFormat('¥ #,###').format(eightPercentTax(customerAmountData.takeOutTotalAmount) + eightPercentTax(customerAmountData.deliveryOrderSlipsTotalAmount))}\n'
                '\t[総売上（税込）]\t\t\t\t\t${NumberFormat('¥ #,###').format(posData.getTotalAmountTaxIncluded())}\n'
                '\t\t（店内 ${NumberFormat('¥ #,### ').format(forHereAmountTaxIncluded())}'
                '   テイク ${NumberFormat('¥ #,### ').format(customerAmountData.takeOutTotalAmount)}'
                '   デリ ${NumberFormat('¥ #,### ').format(customerAmountData.deliveryOrderSlipsTotalAmount)}'
                '）\n'
                '\t\t\t[現金]\t\t\t${NumberFormat('¥ #,###').format(posData.keyGenkinTotalAmount)}\n'
                '\t\t\t[ポイント払い${diffPointKeyAmountTxt() ?? ''}]\t\t\t${NumberFormat('¥ #,###').format(posData.keyPointTotalAmount)}\n'
                '\t\t\t[金券${diffKeyGiftCertificatesAmountTxt() ?? ''}]\t\t\t${NumberFormat('¥ #,###').format(posData.keyGiftCertificateATotalAmount + posData.keyGiftCertificateBTotalAmount)}\t\t\t（'
                '施設 ${NumberFormat('¥ #,###').format(giftCertificateAData.getGiftCertificateATotalAmount() + giftCertificateBData.getGiftCertificateBTotalAmount(false) - giftCertificateBData.getGiftCertificateBTotalChanges())}'
                '   自社 ${NumberFormat('¥ #,###').format(giftCertificateBData.cloudTicketAmount)}'
                '）\t釣銭 ${NumberFormat('¥ #,###').format(giftCertificateBData.getGiftCertificateBTotalChanges())}\n'
                '\t\t\t[キャッシュレス${diffKeyCashlessAmountTxt() ?? ''}]\t\t\t${NumberFormat('¥ #,###').format(posData.keyCashlessTotalAmount)}\n'
                '\t\t\t[アップルペイ${diffApplePayKeyAmountTxt() ?? ''}]\t\t\t${NumberFormat('¥ #,###').format(posData.keyApplePayTotalAmount)}\n'
                '\t\t\t[デリバリー${diffKeyDeliveryAmountTxt() ?? ''}]\t\t\t${NumberFormat('¥ #,###').format(posData.keyDeliveryTotalAmount)}\n'
                '【添付書類】\n'
                '[クレジットカード会社控え${diffCreditReceiptWithSignatureCountTxt() ?? ''}]\t\t\t${NumberFormat(' #,### 枚').format(receiptData.creditReceiptWithSignatureCount)}\n'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
