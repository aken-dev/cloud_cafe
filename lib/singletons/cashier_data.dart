class CustomerAmountData {
  //利用形態ごとの客数と売上
  static final CustomerAmountData _instance = CustomerAmountData._internal();
  int takeOutItemCount = 0;
  int takeOutTotalAmount = 0;
  int forHereOrderCount = 0;
  int deliveryOrderItemCount = 0;
  int deliveryOrderSlipsTotalAmount = 0;

  int getCustomerOrderTotalCount() {
    return takeOutItemCount + forHereOrderCount + deliveryOrderItemCount;
  }

  factory CustomerAmountData() {
    return _instance;
  }

  CustomerAmountData._internal();
}

class CashData {
  //現金
  static final CashData _instance = CashData._internal();
  int oneCoinCount = 0;
  int fiveCoinCount = 0;
  int tenCoinCount = 0;
  int fiftyCoinCount = 0;
  int hundredCoinCount = 0;
  int fiveHundredCoinCount = 0;
  int oneCoinStickCount = 0;
  int fiveCoinStickCount = 0;
  int tenCoinStickCount = 0;
  int fiftyCoinStickCount = 0;
  int hundredCoinStickCount = 0;
  int fiveHundredCoinStickCount = 0;
  int thousandBillCount = 0;
  int twoThousandBillCount = 0;
  int fiveThousandBillCount = 0;
  int tenThousandBillCount = 0;

  int getCashTotalAmount() {
    return (tenThousandBillCount * 10000) +
        (fiveThousandBillCount * 5000) +
        (twoThousandBillCount * 2000) +
        (thousandBillCount * 1000) +
        (fiveHundredCoinStickCount * 25000) +
        (hundredCoinStickCount * 5000) +
        (fiftyCoinStickCount * 2500) +
        (tenCoinStickCount * 500) +
        (fiveCoinStickCount * 250) +
        (oneCoinStickCount * 50) +
        (fiveHundredCoinCount * 500) +
        (hundredCoinCount * 100) +
        (fiftyCoinCount * 50) +
        (tenCoinCount * 10) +
        (fiveCoinCount * 5) +
        (oneCoinCount * 1);
  }

  factory CashData() {
    return _instance;
  }

  CashData._internal();
}

class GiftCertificateAData {
  //金券A
  static final GiftCertificateAData _instance =
      GiftCertificateAData._internal();
  int jtcAmount = 0;
  int acAmount = 0;
  int tacosAmount = 0;
  int localGiftCardAmount = 0;

  int getGiftCertificateATotalAmount() {
    return jtcAmount + acAmount + tacosAmount + localGiftCardAmount;
  }

  factory GiftCertificateAData() {
    return _instance;
  }

  GiftCertificateAData._internal();
}

class GiftCertificateBData {
  //金券B
  static final GiftCertificateBData _instance =
      GiftCertificateBData._internal();
  int xyzAmount = 0;
  int jafAmount = 0;
  int xyzChangeAmount = 0;
  int jafChangeAmount = 0;
  int cloudTicketAmount = 0;

  int getGiftCertificateBTotalAmount(bool isCloudTicketIncluded) {
    if (isCloudTicketIncluded == true) {
      return xyzAmount + jafAmount + cloudTicketAmount;
    } else {
      return xyzAmount + jafAmount;
    }
  }

  int getGiftCertificateBTotalChanges() {
    return xyzChangeAmount + jafChangeAmount;
  }

  factory GiftCertificateBData() {
    return _instance;
  }

  GiftCertificateBData._internal();
}

class CATData {
  //CAT(クレジット端末)
  static final CATData _instance = CATData._internal();
  int creditTotalAmount = 0;
  int iDTotalAmount = 0;
  int quickPayTotalAmount = 0;
  int pointTotalAmount = 0;
  int creditReceiptWithSignatureCount = 0;

  factory CATData() {
    return _instance;
  }

  CATData._internal();
}

class ReceiptData {
  //実在するサイン伝票の枚数
  static final ReceiptData _instance = ReceiptData._internal();
  int creditReceiptWithSignatureCount = 0;

  factory ReceiptData() {
    return _instance;
  }

  ReceiptData._internal();
}

class CashlessTerminalData {
  //電子マネー＆QR決済端末
  static final CashlessTerminalData _instance =
      CashlessTerminalData._internal();
  int qrPayTotalAmount = 0;
  int nanacoTotalAmount = 0;
  int waonTotalAmount = 0;
  int suicaTotalAmount = 0;
  int rakutenEdyTotalAmount = 0;
  int localPayTotalAmount = 0;

  int getCTTotalAmount() {
    return qrPayTotalAmount +
        nanacoTotalAmount +
        waonTotalAmount +
        suicaTotalAmount +
        rakutenEdyTotalAmount +
        localPayTotalAmount;
  }

  factory CashlessTerminalData() {
    return _instance;
  }

  CashlessTerminalData._internal();
}

class POSData {
  //POSレジのデータ
  static final POSData _instance = POSData._internal();
  int keyCashlessTotalAmount = 0; //キャッシュレスキー集計
  int keyGiftCertificateATotalAmount = 0; //金券Aキー集計
  int keyGiftCertificateBTotalAmount = 0; //金券Bキー集計
  int keyDeliveryTotalAmount = 0; //デリバリーキー集計
  int keyApplePayTotalAmount = 0; //アップルペイキー集計
  int keyPointTotalAmount = 0; //ポイントキー集計
  int keyGenkinTotalAmount = 0; //現金キー集計
  int standardAmountForCashReserve = 150000; //釣り銭準備金標準額
  int getGenkinAridakaAmount() {
    return keyGenkinTotalAmount -
        giftCertificateBData.jafChangeAmount -
        giftCertificateBData.xyzChangeAmount;
  }

  int getTotalAmountTaxIncluded() {
    return keyCashlessTotalAmount +
        keyGiftCertificateATotalAmount +
        keyGiftCertificateBTotalAmount +
        keyDeliveryTotalAmount +
        keyApplePayTotalAmount +
        keyPointTotalAmount +
        keyGenkinTotalAmount;
  }

  factory POSData() {
    return _instance;
  }

  POSData._internal();
}

class DepositedCashData {
  //入金機に入金した額のデータ
  static final DepositedCashData _instance = DepositedCashData._internal();
  int depositedCashAmount = 0;
  int depositedGiftCertificatesAmount = 0;
  int depositTimes = 0;
  DateTime lastDepositDateTime = DateTime.now();

  factory DepositedCashData() {
    return _instance;
  }

  DepositedCashData._internal();
}

CustomerAmountData customerAmountData = CustomerAmountData();
CashData cashData = CashData();
GiftCertificateAData giftCertificateAData = GiftCertificateAData();
GiftCertificateBData giftCertificateBData = GiftCertificateBData();
CATData catData = CATData();
ReceiptData receiptData = ReceiptData();
CashlessTerminalData cashlessTerminalData = CashlessTerminalData();
POSData posData = POSData();
DepositedCashData depositedCashData = DepositedCashData();
