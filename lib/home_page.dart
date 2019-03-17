import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List currencies;

  HomePage(this.currencies);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Crypto"),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
        padding: EdgeInsets.all(10.00),
        child: new Column(
          children: <Widget>[
            new Flexible(
                child: new ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                return _getListItemUI(currency, color);
              },
            )),
          ],
        ));
  }

  Card _getListItemUI(Map currency, MaterialColor color) {
    return new Card(
        elevation: 5.1,
        shape:BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.2),
          side: BorderSide(
            color: Colors.deepPurple[100],
            style: BorderStyle.none,
            width: 2.3
          )
        ),
        margin: EdgeInsets.all(08),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: new CircleAvatar(
                backgroundColor: color,
                //Shows first letter of coin.
                child: new Text(currency['symbol']),
              ),
              title: new Text(currency['name'],
                  style: new TextStyle(fontWeight: FontWeight.bold)),
              subtitle: _getSubTitleText(
                  currency['price_usd'], currency['percent_change_1h']),
            )
          ],
        ));
  }

  Widget _getSubTitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD*\n", style: new TextStyle(color: Colors.black54));
    String percentageChangeText = "1 hour: $percentageChange%";

    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }
}
