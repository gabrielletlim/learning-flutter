import 'package:http/http.dart';
import 'dart:convert';

const cryptoCompareUrl = "https://min-api.cryptocompare.com/data/pricemulti";
const apiKey = "c9d0a14667504bf831fe3faef24c7e8b676855feec620aa61d8c6fa578808e6c";

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String currency) async {
    String cryptoListString = cryptoList.join(',');
    String requestURL = '$cryptoCompareUrl?fsyms=$cryptoListString&tsyms=$currency&api_key=$apiKey';
    Uri url = Uri.parse(requestURL);
    Response response = await get(url);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);

      return decodedData;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
