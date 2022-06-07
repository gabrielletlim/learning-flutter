import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:collection';
import 'coin_data.dart';
import 'crypto_card.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  LinkedHashMap<String, dynamic> coinValues = new LinkedHashMap<String, dynamic>();
  bool isWaiting = true;
  String bitcoinValue = '?';

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          cryptoCurrency: crypto,
          selectedCurrency: selectedCurrency,
          value: isWaiting ? '?' : coinValues[crypto][selectedCurrency].toString(),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  DropdownButton getAndroidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (var c in currenciesList) {
      dropdownItems.add(DropdownMenuItem(
        value: c,
        child: Text(c),
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          getData();
        });
      },
    );
  }

  CupertinoPicker getIOSPicker() {
      List<Text> items = [];
      for (var c in currenciesList) {
        items.add(Text(
            c,
            style: TextStyle(
              color: Colors.white,
            ),
        ));
      }

      return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        onSelectedItemChanged: (int selectedIndex) {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        },
        itemExtent: 32.0,
        children: items,
      );
  }

  Widget getPicker() {
    if (Platform.isIOS)
      return getIOSPicker();

    return getAndroidDropdown();
  }

  void getData() async {
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: makeCards()
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
