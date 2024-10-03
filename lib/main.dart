import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './singletons/cashier_data.dart';
import 'tally_paper_sheets.dart';

void main() {
  runApp(const CafeApp());
}

class CafeApp extends StatelessWidget {
  const CafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "クラウドカフェ",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'クラウドカフェホーム'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementTakeOutItemsCounter() {
    setState(() {
      customerAmountData.takeOutItemCount++;
    });
  }

  void _addTakeOutAmount(int amount) {
    setState(() {
      customerAmountData.takeOutTotalAmount += amount;
    });
  }

  void _incrementForHereItemsCounter(int num) {
    setState(() {
      customerAmountData.forHereOrderCount += num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:
            Text("オーダー集計（${DateFormat("yyyy-MM-dd").format(DateTime.now())}）"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                "テイクアウト数",
                style: TextStyle(
                  fontSize: 28 /*サイズ*/,
                ),
              ),
              Text(
                NumberFormat("#,### 個")
                    .format(customerAmountData.takeOutItemCount),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                NumberFormat("¥ #,###")
                    .format(customerAmountData.takeOutTotalAmount),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                    width: 170.0,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _incrementTakeOutItemsCounter();
                        _addTakeOutAmount(384);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0))),
                      child: const Text(
                        "ドリップ\n紅茶\n¥384",
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.1,
                        ),
                      ),
                    )),
                SizedBox(
                    width: 170.0,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _incrementTakeOutItemsCounter();
                        _addTakeOutAmount(512);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0))),
                      child: const Text(
                        "ラテ\nカプチーノ\n¥512",
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.1,
                        ),
                      ),
                    )),
              ]),
              const SizedBox(height: 18),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                    width: 170.0,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _incrementTakeOutItemsCounter();
                        _addTakeOutAmount(576);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0))),
                      child: const Text(
                        "抹茶ラテ\nチャイラテ\n¥576",
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.1,
                        ),
                      ),
                    )),
                SizedBox(
                    width: 170.0,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _incrementTakeOutItemsCounter();
                        _addTakeOutAmount(768);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0))),
                      child: const Text(
                        "黒糖ラテ\nモカ\n¥768",
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.1,
                        ),
                      ),
                    )),
              ]),
              const SizedBox(height: 18),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                    width: 180.0,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _incrementTakeOutItemsCounter();
                        _addTakeOutAmount(1024);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        side: const BorderSide(color: Colors.lightBlue),
                      ),
                      child: const Text(
                        "珈琲フラッペ\nチョコフラッペ\n¥1024",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.1,
                        ),
                      ),
                    )),
                SizedBox(
                    width: 185.0,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _incrementTakeOutItemsCounter();
                        _addTakeOutAmount(1280);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        side: const BorderSide(color: Colors.lightBlue),
                      ),
                      child: const Text(
                        "キウイフラッペ\nキャラメルフラッペ\n¥1280",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.1,
                        ),
                      ),
                    )),
              ]),
              const SizedBox(height: 18),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                    width: 120.0,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _addTakeOutAmount(64);
                      },
                      child: const Text(
                        "豆乳\nホイップ\n¥64",
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.1,
                        ),
                      ),
                    )),
                SizedBox(
                    width: 130.0,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _addTakeOutAmount(128);
                      },
                      child: const Text(
                        "ショット\nフレーバー\nシロップ\n¥128",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.1,
                        ),
                      ),
                    )),
                SizedBox(
                    width: 120.0,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _addTakeOutAmount(256);
                      },
                      child: const Text(
                        "タピオカ\nデカフェ\n¥256",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.1,
                        ),
                      ),
                    )),
              ]),
              const Divider(height: 10),
              const Text(
                "店内客数",
                style: TextStyle(
                  fontSize: 28 /*サイズ*/,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Text(
                  '${customerAmountData.forHereOrderCount}',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                    width: 90.0,
                    height: 90.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _incrementForHereItemsCounter(10);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent,
                          side: const BorderSide(
                            color: Colors.amberAccent,
                            width: 5,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        '＋ 10',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1,
                        ),
                      ),
                    )),
                SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _incrementForHereItemsCounter(1);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent,
                          side: const BorderSide(
                            color: Colors.amberAccent,
                            width: 5,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        '＋ 1',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1,
                        ),
                      ),
                    )),
              ]),
              const Divider(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CustomerCountPage())).then((value) {
                      setState(() {});
                    });
                  },
                  child: const Text(
                    "集計値を編集",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1,
                    ),
                  ),
                )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
