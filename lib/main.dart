import 'package:flutter/material.dart';
import 'package:flutter_app/chart.dart';
import 'package:flutter_app/money.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(
            create: (context) => Money(),
          ),
          ChangeNotifierProvider<Chart>(
            create: (context) => Chart(),
          ),
        ],
        child: Scaffold(
          floatingActionButton: Consumer<Money>(
            builder: (context, money, _) => Consumer<Chart>(
              builder: (context, chart, _) => FloatingActionButton(
                onPressed: () {
                  if (money.balance >= 500) {
                    chart.quantity += 1;
                    money.balance -= 500;
                  }
                },
                child: Icon(
                  Icons.add_shopping_cart,
                ),
                backgroundColor: Colors.purple,
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.purple[700],
            title: Text("Multi Provider"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Balance"),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<Money>(
                          builder: (context, money, _) => Text(
                            money.balance.toString(),
                            style: TextStyle(
                              color: Colors.purple[700],
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      height: 30,
                      width: 60,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.purple[100],
                        border: Border.all(
                          color: Colors.purple[700],
                          width: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<Chart>(
                      builder: (context, chart, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Apple(500) x " + chart.quantity.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            (500 * chart.quantity).toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height: 30,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
