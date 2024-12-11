import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_crypto_calculator/model/crypto_model.dart';
import 'package:http/http.dart' as http;

class CryptoProvider with ChangeNotifier {
  List<CryptoModel> _cryptos = [];

  List<CryptoModel> get cryptos => _cryptos;

  Future<void> fetchCryptoData() async {
    final url = Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _cryptos = data.map((item) => CryptoModel.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load crypto data');
    }
  }
}
