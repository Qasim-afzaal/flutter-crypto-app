import 'package:flutter/material.dart';
import 'package:flutter_crypto_calculator/src/view/main_view.dart';
import 'package:flutter_crypto_calculator/view_model/crypto_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(CryptoMarketApp());

class CryptoMarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CryptoProvider(),
      child: MaterialApp(
        title: 'Crypto Market',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
