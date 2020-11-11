import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinData {
  Future getCoinData({String currency}) async {
    Map<String, String> cryptoPrice = {};

    for (String crypto in cryptoList) {
      http.Response response =
          await http.get('$coinURL/$crypto/$currency?apikey=$apiKey');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double rate = data['rate'];
        cryptoPrice[crypto] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw "Problem with the request";
      }
    }
    return cryptoPrice;
  }
}

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

const coinURL = "https://rest.coinapi.io/v1/exchangerate";
const apiKey = ''; // Use ur own key;
